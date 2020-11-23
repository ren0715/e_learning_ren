class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 4)
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

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:info] = "Category deleted."
      redirect_to request.referrer
    end
  end

  before_action :admin

  private
    def admin
      if !current_user.is_admin?
        flash[:danger] = "You can't access admin pages."
        redirect_to user_dashboard_url(current_user)
      end
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end
end
