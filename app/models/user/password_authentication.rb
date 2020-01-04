class User::PasswordAuthentication < ApplicationRecord
  has_secure_password

  belongs_to :user

  validates :password, presence: true, length: { minimum: 8 }
end
