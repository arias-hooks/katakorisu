class ActivitiesController < ApplicationController
  before_action :set_liff_id, only: [:show]

  def show
    @setting = current_user.setting
  end

  def update
    # 持っているどんぐりを１つ増やす
    acorn_num = current_user.acorn.number + 1
    # 動画の視聴数の合計に1増やす
    video_views = current_user.activity.video_views + 1
    # 動画の再生時間の合計に先ほど再生した動画の時間を加算
    video_viewing_time = current_user.activity.video_viewing_time + params[:duration].to_i
    ActiveRecord::Base.transaction do
      current_user.acorn.update!(number: acorn_num)
      current_user.activity.update!(video_views: video_views, video_viewing_time: video_viewing_time)
    end
    render status: :ok, json: { status: 200 }
  end
end
