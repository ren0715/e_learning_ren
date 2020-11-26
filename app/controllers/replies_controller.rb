class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      flash[:success] = "Created a reply."
      redirect_to request.referrer
    else
      render 'dashboard'
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:comment_id, :content)
  end
end
