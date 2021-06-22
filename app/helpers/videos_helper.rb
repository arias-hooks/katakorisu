module VideosHelper
  def active_category_menu(category)
    return unless params[:category] == category

    'text-yellow-500 bg-gray-100 border-yellow-500'
  end
end
