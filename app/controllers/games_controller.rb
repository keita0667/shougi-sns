class GamesController < ApplicationController
  def index
    @games = Game.all.order('game_date DESC')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.valid?
      @game.save
      redirect_to games_path
    else
      render 'index'
    end
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @game_comments = @game.game_comments.includes(:user).all.order('created_at DESC')
  end

  private

  def game_params
    params.require(:game).permit(:game_date, :zoom, :game_app, :text, :kiryoku_id).merge(user_id: current_user.id)
  end

end
