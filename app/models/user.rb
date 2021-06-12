class User < ApplicationRecord
  has_one :squirrel, dependent: :destroy
  has_one :acorn, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_one :activity, dependent: :destroy
  has_many :user_videos, dependent: :destroy

  validates :line_user_id, presence: true, uniqueness: true
end
