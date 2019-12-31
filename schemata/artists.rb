create_table :artists do |t|
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_users_1,
           }
end