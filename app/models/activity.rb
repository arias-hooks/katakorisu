class Activity < ApplicationRecord
  belongs_to :user

  validates :video_views, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :video_viewing_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, uniqueness: true
end
