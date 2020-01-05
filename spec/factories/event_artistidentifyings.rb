FactoryBot.define do
  factory :event_organizer, class: Event::ArtistIdentifying do
    event
    sequence(:event_id){ |n| "#{n}" }
    sequence(:artist_id){ |n| "#{n}" }
  end
end
