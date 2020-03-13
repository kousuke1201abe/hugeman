class EventManagement::Event::Publishing < ApplicationModel
  attribute :event_publishing, default: -> { Event::Publishing.new }

  # def publish!(args)
  #   event_publishing.create(args[])
  # end
end
