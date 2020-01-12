create_table :events do |t|
  t.references :nightclub,
           null: false,
           index: {
             unique: false,
             name: :idx_events_1,
           }
  t.references :user,
           null: false,
           index: {
             unique: false,
             name: :idx_events_2,
           }
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_events_3,
           }
  t.string :tag,
           null: false,
           index: {
             unique: false,
             name: :idx_events_4,
           }
  t.datetime :start_at,
           null: false,
           index: {
             unique: false,
             name: :idx_events_5,
           }
  t.datetime :end_at,
           null: false,
           index: {
             unique: false,
             name: :idx_events_6,
           }
end

add_foreign_key :events,
                :nightclubs,
                name: :fk_events_1
add_foreign_key :events,
                :users,
                name: :fk_events_2
