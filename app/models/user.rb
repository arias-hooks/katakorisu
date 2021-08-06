class User < ApplicationRecord
  has_one :squirrel, dependent: :destroy
  has_one :acorn, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_one :activity, dependent: :destroy

  validates :line_user_id, presence: true, uniqueness: true

  def can_give_acorn?
    acorn.number.positive? && squirrel.number.positive?
  end
end
