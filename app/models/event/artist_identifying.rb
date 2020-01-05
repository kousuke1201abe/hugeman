class Event::ArtistIdentifying < ApplicationRecord
  belongs_to :event
  belongs_to :artist,
              inverse_of: :event_artist_identifyings
end
