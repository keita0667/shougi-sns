class MemoForm
  include ActiveModel::Model
 
  attr_accessor :text, :genre
  validates :text, presence: true
  validates :genre, presence: true
 
  def save
    Memo.create(text: text)
    Genre.create(genre: genre)
  end
 end