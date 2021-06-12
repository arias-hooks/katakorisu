class CreateSquirrels < ActiveRecord::Migration[6.1]
  def change
    create_table :squirrels do |t|
      t.integer :squirrel_number, null: false, default: 6
      t.integer :total_squirrel_number, null: false, default: 0
      t.references :user, null: false, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
