class UserVideo < ApplicationRecord
  belongs_to :user

  validates :youtube_id, presence: true, format: { with: /^[a-zA-Z0-9_-]{11}$/ }
  validates :user_id, presence: true, uniqueness: { scope: :youtube_id }
end
