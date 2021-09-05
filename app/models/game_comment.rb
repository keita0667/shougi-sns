class GameComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :game, optional: true

  validates :game_comment_text, presence: true
end
