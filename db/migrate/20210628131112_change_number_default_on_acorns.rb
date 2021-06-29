class ChangeNumberDefaultOnAcorns < ActiveRecord::Migration[6.1]
  def change
    change_column_default :acorns, :number, from: 1, to: 0
  end
end
