class SquirrelsController < ApplicationController
  def show; end

  def update
    acorn = current_user.acorn.number - 1
    friends = current_user.squirrel.random_friends
    total_friends = current_user.squirrel.total_number + friends
    ActiveRecord::Base.transaction do
      current_user.acorn.update!(number: acorn)
      current_user.squirrel.update!(number: 0, total_number: total_friends)
    end
    redirect_to squirrel_path(friend_num: friends), notice: t('.message', item: friends)
  end
end
