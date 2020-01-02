FactoryBot.define do
  factory :event_organizer do
    sequence(:name){ |n| "test_organizer_#{n}" }
  end
end
