class ThanksController < ApplicationController
  def create
   
    @thanks = Thank.new
    @thanks = current_user.thanks.create(comment_id: params[:comment_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @thanks = Thank.find_by(comment_id: params[:comment_id])
    @thanks.destroy
    redirect_back(fallback_location: root_path)
  end
end
