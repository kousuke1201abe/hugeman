create_table :user_sessions do |t|
  t.references :user,
               null: false,
               index: {
                 unique: false,
                 name: :idx_user_sessions_1,
               }
  t.string :token,
           null: false,
           index: {
           unique: true,
            name: :idx_user_sessions_2,
           }
  t.datetime :expires_at,
             null: false,
             index: {
              unique: false,
             name: :idx_user_sessions_3,
            }
end

add_foreign_key :user_sessions,
                :users,
                name: :fk_user_sessions_1
