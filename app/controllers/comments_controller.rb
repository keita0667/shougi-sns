class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      render json: { comment: @comment }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
