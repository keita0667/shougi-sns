class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
