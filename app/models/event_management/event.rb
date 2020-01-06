class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }
  
  def self.find(id)
    new(event: Event.find(id))
  end

end
