class Artist < ApplicationRecord
  has_many :events, through: :event_artist_identifyings
  has_many :event_artist_identifyings,
            class_name: "Event::ArtistIdentifying",
            foreign_key: :event_artist_identifying_id
end
