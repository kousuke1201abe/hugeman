FactoryBot.define do
  factory :event_artist_identifying, class: Event::ArtistIdentifying do
    event
    artist
  end
end
