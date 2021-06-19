module SquirrelsHelper
  def animal_count(value)
    "#{value}#{t('defaults.animal')}"
  end
end
