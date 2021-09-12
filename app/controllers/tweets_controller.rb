class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[edit show]
  before_action :move_to_index, except: %i[index show search]
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
    @games = Game.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
    else
      render 'new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    redirect_to root_path if current_user.id != @tweet.user_id
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user).order('created_at DESC')
    gon.current_tweet_id = params[:id]
  end

  def search
    @tweets = SearchTweetsService.search(params[:keyword])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text, :tag).merge(user_id: current_user.id)
  end

  def tweet_update_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
