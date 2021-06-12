FactoryBot.define do
  factory :video do
    youtube_id { "MyString" }
    category { 1 }
    user { nil }
  end
end
