class CreateAcorns < ActiveRecord::Migration[6.1]
  def change
    create_table :acorns do |t|
      t.integer :acorn_number, null: false, default: 1
      t.references :user, null: false, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
