class Setting < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  enum notification: {
    off: 0,  # 通知オフ
    one: 1,  # 肩こリスが1匹増えるごとに通知
    six: 2   # 肩こリスが最大の6匹になったら通知
  }
end
