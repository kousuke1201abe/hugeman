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
