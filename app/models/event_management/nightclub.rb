class EventManagement::Nightclub < ApplicationModel
  attribute :nightclub

  def self.create!(args)
    new(nightclub: Nightclub.create!(args))
  end

end
