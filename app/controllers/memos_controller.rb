class MemosController < ApplicationController
  def index
  end
 
  def create
    @memo = MemoForm.new(set_params)
    if @memo.valid?
      @memo.save
    end
  end
 
  private
  def set_params
    params.permit(:text, :genre)
  end
 end