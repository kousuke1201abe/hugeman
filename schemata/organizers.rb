create_table :event_organizers do |t|
  t.string :name,
           null: false,
           index: {
             unique: true,
             name: :idx_organizers_1,
           }
end
