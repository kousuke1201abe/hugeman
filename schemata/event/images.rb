create_table :event_images do |t|
  t.references :event,
               null: false,
               index: {
                 unique: false,
                 name: :idx_event_images_1,
               }
  t.string :url,
           null: false,
           index: {
             unique: false,
             name: :idx_event_images_2,
           }
end

add_foreign_key :event_images,
                :events,
                name: :fk_event_images_1
