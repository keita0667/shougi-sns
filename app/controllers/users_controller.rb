class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
    @likes = Like.find_by(user_id: user.id)
    @comments = Comment.where(user_id: user.id)
  end
end
