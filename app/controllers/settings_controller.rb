class SettingsController < ApplicationController
  def update
    # 通知設定を更新
    case params[:selected]
    when 'off'
      current_user.setting.off!
    when 'one'
      current_user.setting.one!
    when 'six'
      current_user.setting.six!
    end
    render json: { notification: current_user.setting.notification_i18n, status: 200 }
  end
end
