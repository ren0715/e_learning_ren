class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @lesson = current_user.lessons.new(category_id:@category.id)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end


  def show
    
  end

end