class VideosController < ApplicationController
  before_action :set_youtube_api, only: [:index, :show]

  def index
    case params[:category]
    when 'stretch'
      @videos = Video.stretch.recent
    when 'yoga'
      @videos = Video.yoga.recent
    when 'weight_training'
      @videos = Video.weight_training.recent
    when 'dance'
      @videos = Video.dance.recent
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def set_youtube_api
    gon.youtube_api_key = ENV['YOUTUBE_API_KEY']
  end
end
