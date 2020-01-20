class EventManagement::Event < ApplicationModel
  attribute :event, default: -> { Event.new }
  delegate :name, to: :event
  delegate :artists, to: :event
  delegate :start_at, to: :event
  delegate :end_at, to: :event
  delegate :tag, to: :event
  delegate :nightclub, to: :event

  def self.filter_user_by(args)
    user = User.find(args)
    user.events
  end

  def self.find(id)
    new(event: Event.find(id))
  end

end
