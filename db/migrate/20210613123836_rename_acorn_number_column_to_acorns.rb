class RenameAcornNumberColumnToAcorns < ActiveRecord::Migration[6.1]
  def change
    rename_column :acorns, :acorn_number, :number
  end
end
