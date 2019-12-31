FactoryBot.define do
  factory :events do
    nightclub
    sequence(:name) { |n| "test_event_name#{n}" }
    sequence(:name) { |n| "#test_tag_#{n}" }
    start_at { Time.zone.now }
    end_at { Time.zone.now.since(1.day) }
  end
end
