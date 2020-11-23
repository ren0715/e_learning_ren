class AnswersController < ApplicationController
  before_action :login

  def new
    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.next_word.nil?
      @result = @lesson.correct_answers
      if @lesson.update(result:@result)

        @lesson.create_activity(user: current_user)
        redirect_to @lesson
      end
      
    else
      @answer = Answer.new
      @category = @lesson.category
      @word = @lesson.next_word
      @choices = @word.choices
      
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end

  def login
    if !current_user
      flash[:danger] = "You must be logged in to access this section."
      redirect_to login_url
    end
  end
end
