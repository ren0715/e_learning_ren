class Admin::UsersController < ApplicationController
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
    def add_params
      params.require(:user).permit(is_admin: true)
    end

    def remove_params
      params.require(:user).permit(is_admin: false)
    end
end
