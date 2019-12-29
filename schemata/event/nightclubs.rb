create_table :nightclubs do |t|
  t.string :name, 
           null: false,
           index: {
             unique: false,
             name: :idx_events_1,
           }
end
