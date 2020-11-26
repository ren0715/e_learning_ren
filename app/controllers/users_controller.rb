class UsersController < ApplicationController
  skip_before_action :login, only: [:new, :create],raise: false

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
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
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @lessons = @user.lessons.all
    @howmany = 0
    @activities = Activity.where(user_id: @user.id).paginate(page: params[:page], per_page: 10)
    @comment = Comment.new
  end

  def dashboard
    @users = User.all
    @user = current_user
    @lessons = current_user.lessons.all
    @howmany = 0
    @activities = @user.feed.paginate(page: params[:page], per_page: 10)
  end

  def following
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @howmany = 0
    @users = @user.following.paginate(page: params[:page], per_page: 5)
  end
  def followers
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @howmany = 0
    @users = @user.followers.paginate(page: params[:page], per_page: 5)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end
end
