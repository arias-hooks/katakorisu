FactoryBot.define do
  factory :activity do
    video_views { 1 }
    video_viewing_time { 1 }
    user { nil }
  end
end
