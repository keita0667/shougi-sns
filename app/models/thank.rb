class Thank < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :comment, optional: true, dependent: :destroy
  # validates_uniqueness_of :comment_id, scope: :user_id
end
