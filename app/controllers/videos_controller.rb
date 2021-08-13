class VideosController < ApplicationController
  before_action :set_youtube_api, only: [:index, :show]

  def index
    case params[:category]
    when 'stretch'
      @videos = Video.stretch.recent.page(params[:page])
    when 'yoga'
      @videos = Video.yoga.recent.page(params[:page])
    when 'weight_training'
      @videos = Video.weight_training.recent.page(params[:page])
    when 'dance'
      @videos = Video.dance.recent.page(params[:page])
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def set_youtube_api
    gon.youtube_api_key = Rails.application.credentials.dig(:youtube, :api_key)
  end
end
