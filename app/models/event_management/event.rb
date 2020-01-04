class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }
end
