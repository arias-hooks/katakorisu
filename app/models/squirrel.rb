class Squirrel < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :total_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, uniqueness: true

  # 現在のリスの数が多いほど、小さい数をランダムで返す。友達になるリスの数をランダムにするためのメソッド
  def random_friend_number
    case number
    when 1
      probability = 1
    when 2
      probability = 0.95
    when 3
      probability = 0.85
    when 4
      probability = 0.7
    when 5
      probability = 0.3
    when 6
      probability = 0.15
    end

    if probability >= rand
      number
    elsif probability + 0.2 >= rand
      number - 1
    elsif probability + 0.4 >= rand
      number - 2
    else
      number - 3
    end
  end
end
