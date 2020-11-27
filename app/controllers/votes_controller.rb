class VotesController < ApplicationController
  def index
    @activity = Activity.find(params[:activity_id])
    #@users = User.where(id: @activity.votes.user_id)
    @votes = @activity.votes
    @users = User.all
  end
end
