class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }
  delegate :name, :artists, :start_at, :end_at, :tag, :nightclub, :update!, to: :event

  def self.filter_user_by(args)
    user = User.find(args)
    user.events
  end

  def self.find(id)
    new(event: Event.find(id))
  end

  def update!(args)
    event.update!(args)
  end
end
