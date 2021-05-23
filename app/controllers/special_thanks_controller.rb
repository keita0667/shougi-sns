class SpecialThanksController < ApplicationController
  def create
    @special_thanks = SpecialThank.new
    @special_thanks = current_user.special_thanks.create(comment_id: params[:comment_id])
    binding.pry
  end

  def destroy
    @special_thanks = Like.find_by(comment_id: params[:comment_id])
    @special_thanks.destroy
  end
end
