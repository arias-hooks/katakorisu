module ApplicationHelper
  def page_title(page_title = '')
    base_title = '肩こリス'
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end

  def active_menu(target_controller)
    return unless params[:controller] == target_controller

    'text-gray-900'
  end
end
