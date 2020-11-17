class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.next_word.nil?
      @answers = @lesson.answers.all
      @result = 0
      @answers.each do |answer|
        if answer.choice.is_correct
          @result +=1
        end
      end
      if @lesson.update(result:@result)
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
end
