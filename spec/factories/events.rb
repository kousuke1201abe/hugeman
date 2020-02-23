FactoryBot.define do
  factory :event do
    nightclub
    user
    sequence(:name) { |n| "test_event_name#{n}" }
    sequence(:tag) { |n| "#test_tag_#{n}" }
    start_at { Time.zone.now }
    end_at { Time.zone.now.since(1.day) }
    sequence(:url_code) { |n| "#test_event_url_code#{n}" }

    trait :published do
      association :publishing,
                  factory: :event_publishing,
                  strategy: :build
    end
  end
end
