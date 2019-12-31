create_table :artists do |t|
  t.string :name,
           null: false,
           index: {
             unique: true,
             name: :idx_artists_1,
           }
end
