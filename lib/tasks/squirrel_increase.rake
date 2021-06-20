namespace :squirrel_increase do
  desc "肩こリスの数が最大の6匹でないならば、１匹増やすようにする"
  task update_squirrel_number: :environment do
    Squirrel.where('number <= ?', 5).find_each do |squirrel|
      squirrel.update!(number: squirrel.number + 1)
      user = User.find(squirrel.user_id)
      if user.setting.one?
        puts "肩こリスが#{squirrel.number}匹に増えました！"
      elsif user.setting.six? && squirrel.number == 6
        puts "肩こリスが6匹に増えました！"
      end
    end
  end
end
