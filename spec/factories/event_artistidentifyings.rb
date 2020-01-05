FactoryBot.define do
  factory :event_artistidentifying, class: Event::Artistidentifying do
    event
    sequence(:event_id){ |n| "#{n}" }
    sequence(:artist_id){ |n| "#{n}" }
  end
end
