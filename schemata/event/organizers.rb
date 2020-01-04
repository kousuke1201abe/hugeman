create_table :event_organizers do |t|
  t.string :name,
            null: false,
            index: {
              name: :idx_event_organizers_1
             }

t.references :event,
            null: false,
            index: {
            unique: false,
            name: :idx_event_organizers_2
           }
end

add_foreign_key :event_organizers,
                :events,
                name: :fk_event_organizers_1