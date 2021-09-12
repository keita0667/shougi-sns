class GameCommentsController < ApplicationController
  def create
    @game_comment = GameComment.new(game_comment_params)
    if @game_comment.valid?
      @game_comment.save
      render json: { game_comment: @game_comment }
    end
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:game_comment_text).merge(user_id: current_user.id, game_id: params[:game_id])
  end
end
