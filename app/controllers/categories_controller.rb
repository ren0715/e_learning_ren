class CategoriesController < ApplicationController

  def index
    @page = params[:learned]
    @ids = current_user.lessons.pluck(:category_id)
    if params[:learned].eql?("learned")
      @categories = Category.where(id: @ids).joins("INNER JOIN words ON words.category_id = categories.id").distinct.paginate(page: params[:page], per_page: 10)
    elsif params[:learned].eql?("notlearned")
      @categories = Category.where.not(id: @ids).joins("INNER JOIN words ON words.category_id = categories.id").distinct.paginate(page: params[:page], per_page: 10)
    else
      @categories = Category.all.joins("INNER JOIN words ON words.category_id = categories.id").distinct.paginate(page: params[:page], per_page: 10)
    end
    # @count = 0
    # @categories.each do |category|
    #   if category.words.count != 0
    #     @count +=1
    #   end
    # end
  end
  
end
