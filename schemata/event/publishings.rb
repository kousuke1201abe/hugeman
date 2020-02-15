create_table :event_publishings do |t|
t.references :event,
            null: false,
            index: {
              unique: true,
              name: :idx_event_publishings_1
            }
end

add_foreign_key :event_publishings,
                :events,
                name: :fk_event_publishings_1
