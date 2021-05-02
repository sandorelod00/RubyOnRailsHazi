class FeedbackController < ApplicationController
  def new
    @comment = Comment.new
    @comment.createdByUserId = session[:user]
    @comment.toUserId = params[:toUserId]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.createdByUserId = session[:user]
    @comment.toUserId =
    @comment.save
    redirect_back fallback_location: profile_path(@comment.toUserId)
  end

  private
  def comment_params
    params.require(:comment).permit([:createdByUserId, :toUserId, :content])
  end
end
