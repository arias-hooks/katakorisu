namespace :squirrel_increase do
  desc "肩こリスの数が最大の6匹でないならば、１匹増やすようにする"
  task update_squirrel_number: :environment do
    Squirrel.where('number <= ?', 5).find_each do |squirrel|
      squirrel.update!(number: squirrel.number + 1)
      user = User.find(squirrel.user_id)
      if user.setting.one?
        message = {
          type: 'text',
          text: "肩こリスが#{squirrel.number}匹に増えました！$",
          "emojis": [
            {
              "index": 14,
              "productId": "5ac21184040ab15980c9b43a",
              "emojiId": "095"
            }
          ]
        }
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        end
        response = client.push_message(user.line_user_id, message)
        p response
      elsif user.setting.six? && squirrel.number == 6
        message = {
          type: 'text',
          text: "肩こリスが6匹に増えました！$",
          "emojis": [
            {
              "index": 14,
              "productId": "5ac21184040ab15980c9b43a",
              "emojiId": "095"
            }
          ]
        }
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        end
        response = client.push_message(user.line_user_id, message)
        p response
      end
    end
  end
end
