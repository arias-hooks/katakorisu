class Squirrel < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :total_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, uniqueness: true

  def random_friends
    if number <= 3
      number
    else
      case rand(1..10)
      when 1..3
        number - 2
      when 3..6
        number - 1
      else
        number
      end
    end
  end
end
