create_table :hello_worlds do |t|
  t.string :description,
           null: false,
           index: {
             unique: false,
             name: :idx_hello_worlds_1,
           }
end
