create_table :users do |t|
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_users_1,
           }
  t.string :email,
           null: false,
           index: {
             unique: true,
             name: :idx_users_2,
           }
end
