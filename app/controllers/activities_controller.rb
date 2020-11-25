class ActivitiesController < ApplicationController

  def upvote
    @activity = Activity.find(params[:id])
    @activity.votes.create(user_id: current_user.id)

    redirect_to request.referrer
  end

  def downvote
    @activity = Activity.find(params[:id])
    @activity.votes.find_by(user_id: current_user.id).destroy

    redirect_to request.referrer
  end

end
