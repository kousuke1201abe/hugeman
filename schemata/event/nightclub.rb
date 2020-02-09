create_table :event_nightclub do |t|

  t.string :name,
              null: false,
              index: {
                unique: false,
                name: :idx_event_nightclub_1
              }
