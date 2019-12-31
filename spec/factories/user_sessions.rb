FactoryBot.define do
  factory :user_session, class: User::Session do
    user
    sequence(:token) { |n| "test user session#{n}" }
    expires_at { Time.zone.now.since(1.day) }
  end
end
