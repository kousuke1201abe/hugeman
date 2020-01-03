create_table :event_images do |t|
  t.references :event,
               null: false,
               index: {
                 unique: false,
                 name: :idx_event_images_1,
               }
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_event_images_2,
           }
end
