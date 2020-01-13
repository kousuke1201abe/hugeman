class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }

  def self.all
    new(event: Event.all)
  end

  def self.find(id)
    new(event: Event.find(id))
  end

end
