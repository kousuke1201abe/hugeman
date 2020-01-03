FactoryBot.define do
  factory :event_image, class: Event::Image do
    event
    name { "test.jpg" }
  end
end
