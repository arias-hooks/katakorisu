FactoryBot.define do
  factory :user do
    sequence(:line_user_id) { |n| "line_user_id#{n}" }
  end
end
