class EventManagement::User < ApplicationModel
  attribute :user, default: -> { User.new }
end
