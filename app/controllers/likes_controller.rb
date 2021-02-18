class LikesController < ApplicationController
  # def create
  #   @like = Like.new
  #   @like = current_user.likes.create(tweet_id: params[:tweet_id])
  #   redirect_back(fallback_location: root_path)
  # end

  # def destroy
  #   @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
  #   @like.destroy
  #   redirect_back(fallback_location: root_path)
  # end

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end
end
