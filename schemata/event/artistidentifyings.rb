create_table :event_artistidentifyings do |t|

t.references :event,
            null: false,
            foreign_key: true,
            index: {
              unique: false,
              name: :idx_event_artistidentifyings_1
            }

t.references :artist,
            null: false,
            foreign_key: true,
            index: {
              unique: false,
              name: :idx_event_artistidentifyings_2
            }
end

add_foreign_key :event_artistidentifyings,
                :events,
                name: :idx_event_artistidentifyings_1

add_foreign_key :event_artistidentifyings,
                :artists,
                name: :idx_event_artistidentifyings_2
