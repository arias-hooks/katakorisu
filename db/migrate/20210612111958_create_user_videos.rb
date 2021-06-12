class CreateUserVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_videos do |t|
      t.string :youtube_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_videos, [:user_id, :youtube_id], unique: true
  end

end
