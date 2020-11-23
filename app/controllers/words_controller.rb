class WordsController < ApplicationController
  before_action :login
  
  def index
    @cate = params[:cate]
    @category = Category.find_by(title: params[:cate])
    if @cate
      @lessons = Lesson.where(category_id: @category.id)
    else
      @lessons = Lesson.where(user_id: current_user.id)
    end
    
    # @answers = @lessons.answers
    @categories = Category.all
    # @words = @categories.words
    
  end

  private
  def login
    if !current_user
      flash[:danger] = "You must be logged in to access this section."
      redirect_to login_url
    end
  end
end
