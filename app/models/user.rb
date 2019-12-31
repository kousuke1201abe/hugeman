class User < ApplicationRecord
  has_one :password_authentication
  has_many :sessions, dependent: :destroy
end
