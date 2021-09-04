class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
    @comments = Comment.where(user_id: user.id)
  end
end
