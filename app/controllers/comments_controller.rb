class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Created a comment."
      redirect_to request.referrer
    else
      render 'dashboard'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:activity_id, :content)
  end
end
