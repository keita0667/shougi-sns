class Comment < ApplicationRecord
  belongs_to :tweet, optional: true, dependent: :destroy
  belongs_to :user, optional: true, dependent: :destroy
  has_many :special_thanks, dependent: :destroy
  has_many :thanks, dependent: :destroy
end
