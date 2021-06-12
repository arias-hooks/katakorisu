class Video < ApplicationRecord
  validates :youtube_id, presence: true, uniqueness: true, format: { with: /^[a-zA-Z0-9_-]{11}$/ }

  enum category: {
    stretch: 0,          # ストレッチ
    yoga: 1,             # ヨガ
    weight_training: 2,  # 筋トレ
    dance: 3             # ダンス
  }
end
