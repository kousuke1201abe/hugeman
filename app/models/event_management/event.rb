class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }

  def self.filter_user_by(args)
    user = User.find(args)
    user.events
  end

  def self.find(id)
    new(event: Event.find(id))
  end

end
