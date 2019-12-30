create_table :nightclubs do |t|
  t.string :name, 
           null: false,
           index: {
             unique: true,
             name: :idx_nightclubs_1,
           }
end
