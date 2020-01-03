FactoryBot.define do
  factory :event_image, class: Event::Image do
    event
    url { "test.jpg" }
  end
end
