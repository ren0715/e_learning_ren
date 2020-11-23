class LessonsController < ApplicationController
  before_action :login
  
  def create
    @category = Category.find(params[:category_id])
    @lesson = current_user.lessons.new(category_id:@category.id)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end


  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers.all
    @category = @lesson.category
    @words = @category.words
    

  end

  private
  def login
    if !current_user
      flash[:danger] = "You must be logged in to access this section."
      redirect_to login_url
    end
  end
end
