class ChangeNotificationDefaultOnSettings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :settings, :notification, from: 0, to: 2
  end
end
