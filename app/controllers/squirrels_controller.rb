class SquirrelsController < ApplicationController
  def show; end

  def update
    if current_user.acorn.number >= 1
      # 持っているどんぐりを１つ減らす
      current_user.acorn.number -= 1
      # 友達になるリスの数を変数に入れる
      friend_num = current_user.squirrel.random_friend_number
      # 現在のリスの数を代入
      current_user.squirrel.number -= friend_num
      # 今まで友だちになったリスの合計に今回友だちになったリスを加算し代入
      current_user.squirrel.total_number += friend_num

      ActiveRecord::Base.transaction do
        current_user.acorn.save!
        current_user.squirrel.save!
      end
      redirect_to squirrel_path(friend_num: friend_num), notice: t('.message', item: friend_num)
    else
      redirect_to squirrel_path, notice: t('.do_not_have')
    end
  end
end
