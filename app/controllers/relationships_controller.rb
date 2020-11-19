class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:followed_id])

    current_user.follow(other_user)
    flash[:success] = "Relationship created!"
    redirect_to request.referrer
  end

  def destroy
    other_user = User.find(params[:followed_id])
    @relationship = current_user.relationship(other_user)
    if @relationship.destroy
      flash[:info] = "Relationship deleted."
    end

    redirect_to request.referrer
  end
end
