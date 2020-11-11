class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "category created!"
      redirect_to admin_categories_url
    else
      render 'admin/new' 
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end