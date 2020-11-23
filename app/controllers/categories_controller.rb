class CategoriesController < ApplicationController
  before_action :login

  def index
    @page = params[:learned]
    @ids = current_user.lessons.pluck(:category_id)
    if params[:learned].eql?("learned")
      @categories = Category.where(id: @ids).paginate(page: params[:page], per_page: 10)
    elsif params[:learned].eql?("notlearned")
      @categories = Category.where.not(id: @ids).paginate(page: params[:page], per_page: 10)
    else
      @categories = Category.all.paginate(page: params[:page], per_page: 10)
    end
  end

  private
  def login
    if !current_user
      flash[:danger] = "You must be logged in to access this section."
      redirect_to login_url
    end
  end
end
