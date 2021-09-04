class User < ApplicationRecord
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

  validates :nickname, presence: true, length: { maximum: 6, message: "is maximum of 6 characters"}
  validates :kiryoku_id, numericality: { other_than: 1, message: "can't be blank" }
end
