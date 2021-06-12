class User < ApplicationRecord
  has_one :squirrel, dependent: :destroy

  validates :line_user_id, presence: true, uniqueness: true
end
