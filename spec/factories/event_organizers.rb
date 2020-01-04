FactoryBot.define do
  factory :event_organizer, class: Event::Organizer do
    sequence(:name){ |n| "test_organizer_#{n}" }
  end
end
