class ActivitiesController < ApplicationController

  def upvote
    @activity = Activity.find(params[:id])
    @activity.votes.create(user_id: current_user.id)

    # @users = User.all
    # @user = current_user
    # @lessons = current_user.lessons.all
    # @howmany = 0
    # @activities = @user.feed.paginate(page: params[:page], per_page: 10)

    redirect_to request.referrer
  end

  def downvote
    @activity = Activity.find(params[:id])
    @activity.votes.find_by(user_id: current_user.id).destroy

    # @users = User.all
    # @user = current_user
    # @lessons = current_user.lessons.all
    # @howmany = 0
    # @activities = @user.feed.paginate(page: params[:page], per_page: 10)

    redirect_to request.referrer
  end

end
