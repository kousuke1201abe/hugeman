create_table :event_artist_identifyings do |t|

t.references :event,
            null: false,
            index: {
              unique: false,
              name: :idx_event_artist_identifyings_1
            }

t.references :artist,
            null: false,
            index: {
              unique: false,
              name: :idx_event_artist_identifyings_2
            }
end

add_foreign_key :event_artist_identifyings,
                :events,
                name: :idx_event_artist_identifyings_1

add_foreign_key :event_artist_identifyings,
                :artists,
                name: :idx_event_artist_identifyings_2
