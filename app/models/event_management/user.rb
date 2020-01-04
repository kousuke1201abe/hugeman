class EventManagement::User < ApplicationModel
  attribute :user, default: -> { User.new }

  def self.create!(args)
    ActiveRecord::Base.transaction do
      user = User.create!(name: args[:name], email: args[:email])
      user.create_password_authentication!(password: args[:password])
      new(user: user)
    end
  end
end
