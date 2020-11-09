class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:info] = "Please log in."
      redirect_to login_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
