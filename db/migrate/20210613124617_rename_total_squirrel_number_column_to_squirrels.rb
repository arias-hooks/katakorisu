class RenameTotalSquirrelNumberColumnToSquirrels < ActiveRecord::Migration[6.1]
  def change
    rename_column :squirrels, :total_squirrel_number, :total_number
  end
end
