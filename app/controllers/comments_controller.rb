class CommentsController < ApplicationController
  
  def index
    @users = User.all
    @activity = Activity.find(params[:activity_id])
    @comments = Comment.where(activity_id: @activity.id)
    @reply = Reply.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Created a comment."
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:activity_id, :content)
  end
end
