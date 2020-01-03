create_table :event_organizers do |t|
  t.string :name,
           null: false,
           index: {
             name: :idx_event_organizers_1
           }
end

add_foreign_key :event_organizers,
                :events,
                name: :fk_event_organizers_1

add_foreign_key :event_organizers,
                :events,
                id: :fk_event_id_1