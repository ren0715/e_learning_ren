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
      render 'new' 
    end
  end

  def edit
    @category = Category.find(params[:id])
    
  end
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = "Category updated!"
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
