class User::PasswordAuthentication < ApplicationRecord
  has_secure_password

  belongs_to :user
end
