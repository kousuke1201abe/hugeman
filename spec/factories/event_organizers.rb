FactoryBot.define do
  factory :event_organizer, class: Event::Organizer do
    event
    url { "test.jpg" }
  end
end
