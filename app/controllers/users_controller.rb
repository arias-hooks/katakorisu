class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    gon.liff_id = ENV['LIFF_ID']
  end

  def create
    id_token = params[:idToken]
    channel_id = ENV['CHANNEL_ID']
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    line_user_id = JSON.parse(res.body)["sub"]
    user = User.find_by(line_user_id: line_user_id)
    if user.nil?
      user = User.create!(line_user_id: line_user_id)
      Squirrel.create!(user: user)
      Acorn.create!(user: user)
      Activity.create!(user: user)
      Setting.create!(user: user)
      session[:user_id] = user.id
    elsif user
      session[:user_id] = user.id
    end
  end
end
