class CategoriesController < ApplicationController

  def index
    @page = params[:learned]
    @ids = current_user.lessons.pluck(:category_id)
    if params[:learned].eql?("learned")
      @categories = Category.joins(:words).distinct.where(id: @ids).paginate(page: params[:page], per_page: 10)
    elsif params[:learned].eql?("notlearned")
      @categories = Category.joins(:words).distinct.where.not(id: @ids).paginate(page: params[:page], per_page: 10)
    else
      @categories = Category.joins(:words).distinct.paginate(page: params[:page], per_page: 10)
    end
  end
  
end
