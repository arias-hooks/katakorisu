module VideosHelper
  def current_category(category)
    case category
    when 'stretch'
      I18n.t('enums.video.category.stretch')
    when 'yoga'
      I18n.t('enums.video.category.yoga')
    when 'weight_training'
      I18n.t('enums.video.category.weight_training')
    when 'dance'
      I18n.t('enums.video.category.dance')
    end
  end
end
