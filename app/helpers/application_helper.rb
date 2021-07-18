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

  def default_meta_tags
    {
      site: '肩こリス',
      title: '肩こり解消サポートアプリ',
      reverse: true,
      charset: 'utf-8',
      description: '肩こリスは、エクササイズ動画を見ることで、肩こりを解消してもらうことを目的としたアプリです。',
      keywords: '肩こリス, 肩こりす, 肩こり, フィットネス, エクササイズ, 運動, 健康, 腰痛',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('squirrel/6.gif'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: :canonical,
        image: image_url('squirrel/6.gif'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@katakorisu1'
      }
    }
  end
end
