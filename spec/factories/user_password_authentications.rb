FactoryBot.define do
  factory :user_password_authentication, class: User::PasswordAuthentication do
    user
    password { "password" }
  end
end
