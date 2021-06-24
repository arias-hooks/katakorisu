module ApplicationHelper
  def page_title(page_title = '')
    base_title = t('defaults.app_name')
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end

  def active_footer_menu(target_controller)
    return unless params[:controller] == target_controller

    'text-gray-900'
  end

  def animal_count(value)
    "#{value}#{t('defaults.animal')}"
  end

  def views_count(value)
    "#{value}#{t('defaults.views')}"
  end

  def workout_time_count(value)
    "#{value / 60}#{t('defaults.minute')}"
  end
end
