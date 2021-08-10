class SquirrelsController < ApplicationController
  def show; end

  def update
    # 持っているどんぐりを１つ減らす
    current_acorn = current_user.acorn.number - 1
    # 友達になるリスの数がランダムに決める
    friend_number = current_user.squirrel.random_friend_number
    # 現在のリスの数を計算
    current_squirrel = current_user.squirrel.number - friend_number
    # 今まで友だちになったリスの合計に今回友だちになったリスを加算
    total_friends = current_user.squirrel.total_number + friend_number
    ActiveRecord::Base.transaction do
      current_user.acorn.update!(number: current_acorn)
      current_user.squirrel.update!(number: current_squirrel, total_number: total_friends)
    end
    redirect_to squirrel_path(friend_num: friend_number), notice: t('.message', item: friend_number)
  end
end
