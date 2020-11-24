class CategoriesController < ApplicationController

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
    @count = 0
    @categories.each do |category|
      if category.words.count != 0
        @count +=1
      end
    end
  end
  
end
