class GameComment < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :game, optional: true, dependent: :destroy

  validates :game_comment_text, presence: true
end
