class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :youtube_id, null: false, index: { unique: true }
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
