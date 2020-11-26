class SessionsController < ApplicationController
  skip_before_action :login,raise: false
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    # check is @user is not empty
    # check if @user's password is equal to params[:session][:password]
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:info] = "Successfully logged in."
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid Credentials!"
      render 'new'
    end
  end

  def destroy
    @user = current_user
    log_out @user
    flash[:info] = "Successfully logged out."
    redirect_to root_url
  end
end
