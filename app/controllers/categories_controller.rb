class CategoriesController < ApplicationController
  def index
    
    @ids = current_user.lessons.pluck(:category_id)
    if params[:learned].eql?("learned")
      @categories = Category.where(id: @ids).paginate(page: params[:page], per_page: 10)
    elsif params[:learned].eql?("notlearned")
      @categories = Category.where.not(id: @ids).paginate(page: params[:page], per_page: 10)
    else
      @categories = Category.all.paginate(page: params[:page], per_page: 10)
    end
  end
end
