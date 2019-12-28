class User < ApplicationRecord
  has_one :password_authentication
end
