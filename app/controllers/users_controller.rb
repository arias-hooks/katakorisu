class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_liff_id, only: [:new]

  def new; end

  def create
    # JSからLINEのユーザーIDトークンを取得
    id_token = params[:idToken]
    channel_id = ENV['CHANNEL_ID']
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    # LINEユーザーIDを取得
    line_user_id = JSON.parse(res.body)["sub"]
    # ユーザー登録されているか確認
    user = User.find_by(line_user_id: line_user_id)
    # DBにuserが保存されていればログインし、保存されていなければユーザー作成する
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
