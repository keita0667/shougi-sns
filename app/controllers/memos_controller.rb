class MemosController < ApplicationController
  def index
  end
 
  def create
    binding.pry
    @memo = MemoForm.new(set_params)
    if @memo.valid?
      @memo.save
    end
  end
 
  private
  def set_params
    params.permit(:text, :genre)
  end

 @game_comment = GameComment.new(game_comment_params)
 if @game_comment.valid?
   @game_comment.save
   render json:{ game_comment: @game_comment }
 end
end