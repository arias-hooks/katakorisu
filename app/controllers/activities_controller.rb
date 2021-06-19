class ActivitiesController < ApplicationController
  def show
    gon.liff_id = ENV['LIFF_ID']
    @setting = current_user.setting
  end

  def update
    ActiveRecord::Base.transaction do
      current_user.acorn.increment!(:number, 1)
      current_user.activity.increment!(:video_views, 1)
      current_user.activity.increment!(:video_viewing_time, params[:duration].to_i)
    end
    respond_to do |format|
      format.json { render status: :ok, json: { status: 200 } }
    end
  end
end
