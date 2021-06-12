class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :line_user_id, null: false

      t.timestamps
      t.index :line_user_id, unique: true
    end
  end
end
