class Acorn < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, uniqueness: true
end
