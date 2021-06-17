class VideosController < ApplicationController
  def index
    gon.youtube_api_key = ENV['YOUTUBE_API_KEY']

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
end
