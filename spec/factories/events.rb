FactoryBot.define do
  factory :event do
    nightclub
    user
    sequence(:name) { |n| "test_event_name#{n}" }
    sequence(:tag) { |n| "#test_tag_#{n}" }
    start_at { Time.zone.now }
    end_at { Time.zone.now.since(1.day) }
  end
end
