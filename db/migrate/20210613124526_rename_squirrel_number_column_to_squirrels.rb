class RenameSquirrelNumberColumnToSquirrels < ActiveRecord::Migration[6.1]
  def change
    rename_column :squirrels, :squirrel_number, :number
  end
end
