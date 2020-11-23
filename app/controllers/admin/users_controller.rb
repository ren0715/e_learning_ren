class Admin::UsersController < ApplicationController
  before_action :admin
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def add
    @user = User.find(params[:id])
    if @user.update(is_admin: true)
      flash[:info] = "Added as Admin."
      redirect_to request.referrer
    end
  end
  
  def remove
    @user = User.find(params[:id])
    if @user.update(is_admin: false)
      flash[:success] = "Removed as Admin."
      redirect_to request.referrer
    end
  end

  private
  def admin
    if !current_user.is_admin?
      flash[:danger] = "You can't access admin pages."
      redirect_to user_dashboard_url(current_user)
    end
  end
end
