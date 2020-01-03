create_table :event_organizers do |t|
  t.string :name,
           null: false,
           index: {
             unique: true,
             name: :idx_organizers_1,
           }
end

add_foreign_key :event_organizers,
                :events,
                name: :fk_event_ids_1
