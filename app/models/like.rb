class Like < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :tweet, counter_cache: :likes_count, optional: true, dependent: :destroy
  validates_uniqueness_of :tweet_id, scope: :user_id
end
