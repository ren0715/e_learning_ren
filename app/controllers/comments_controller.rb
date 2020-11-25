class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Created a comment."
      redirect_to request.referrer
    else
      render 'dashboard'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :activity_id, :content)
  end
end
