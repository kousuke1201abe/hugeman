create_table :user_password_authentications do |t|
  t.references :user,
               null: false,
               index: {
                 unique: true,
                 name: :idx_user_password_authentications_1,
               }
  t.string :password_digest,
           null: false
end

add_foreign_key :user_password_authentications,
                :users,
                name: :fk_user_password_authentications_1
