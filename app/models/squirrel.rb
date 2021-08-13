class Squirrel < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :total_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, uniqueness: true

  # number(現在のリスの数)が多いほど、小さい数をランダムで返す。友達になるリスの数をランダムにするためのメソッド
  def random_friend_number
    # number（現在いるリス）が小さいほど、probabilityに1に近い数を入れる
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
    else
      raise 'リスの数が不正です'
    end

    # probabilityが1に近いほど、number（現在いるリス）に近い数を返す可能性が高い
    i = rand
    if probability >= i
      number
    elsif probability + 0.2 >= i
      number - 1
    elsif probability + 0.4 >= i
      number - 2
    else
      number - 3
    end
  end
end
