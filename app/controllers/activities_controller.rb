class ActivitiesController < ApplicationController
  def show
    @setting = current_user.setting
  end
end
