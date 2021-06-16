class SettingsController < ApplicationController
  before_action :update_notification, only: :update

  def update
    respond_to do |format|
      format.json { render json: { notification: current_user.setting.notification_i18n } }
    end
  end

  private

  def update_notification
    case params[:selected]
    when 'off'
      current_user.setting.off!
    when 'one'
      current_user.setting.one!
    when 'six'
      current_user.setting.six!
    end
  end
end
