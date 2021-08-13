namespace :squirrel_increase do
  def line_bot_client
    Line::Bot::Client.new do |config|
      config.channel_secret = Rails.application.credentials.dig(:line, :channel_secret)
      config.channel_token = Rails.application.credentials.dig(:line, :channel_token)
    end
  end

  def line_message(squirrel)
    {
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
  end

  desc "肩こリスの数が最大の6匹でないならば、１匹増やすようにする"
  task update_squirrel_number: :environment do
    Squirrel.where('number <= ?', 5).find_each do |squirrel|
      # 現在のリスを1匹増やす
      squirrel.update!(number: squirrel.number + 1)
      p "実行しました。#{Time.zone.now}"
      user = User.find(squirrel.user_id)
      # 通知設定が「1匹増えるごとに通知」の場合
      if user.setting.one?
        message = line_message(squirrel)
        client = line_bot_client
        client.push_message(user.line_user_id, message)
      # 通知設定が「最大の6匹になったら通知」の場合
      elsif user.setting.six? && squirrel.number == 6
        message = line_message(squirrel)
        client = line_bot_client
        client.push_message(user.line_user_id, message)
      end
    end
  end
end
