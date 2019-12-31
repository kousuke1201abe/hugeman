create_table :events do |t|
  t.references :nightclub,
           null: false,
           index: {
             unique: true,
             name: :idx_nightclub_event_1,
           }
  t.string :event_name,
           null: false,
           index: {
             unique: false,
           }
  t.string :tag,
           null: false,
           index: {
             unique: false,
           }
  t.datetime :start_at,
           null: false,
           index: {
             unique: false,
           }
  t.datetime :end_at,
           null: false,
           index: {
             unique: false,
           }
end

add_foreign_key :events,
                :nightclubs,
                name: :fk_events_1
