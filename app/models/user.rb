class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :special_thanks
  has_many :thanks
  has_many :games
  has_many :game_comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :kiryoku

  validates :nickname, presence: true
  validates :kiryoku_id, numericality: { other_than: 1 }

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
end
