class Game < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(
    name
    game_date(1i) game_date(2i) game_date(3i) game_date(4i) game_date(5i)
  )

  belongs_to :user, optional: true, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kiryoku
  has_many :game_comments, dependent: :destroy
end
