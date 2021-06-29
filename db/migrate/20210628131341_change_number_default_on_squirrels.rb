class ChangeNumberDefaultOnSquirrels < ActiveRecord::Migration[6.1]
  def change
    change_column_default :squirrels, :number, from: 6, to: 5
  end
end
