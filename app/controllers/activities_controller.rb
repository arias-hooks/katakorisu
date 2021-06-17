class ActivitiesController < ApplicationController
  def show
    gon.liff_id = ENV['LIFF_ID']
    @setting = current_user.setting
  end
end
