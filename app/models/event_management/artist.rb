class EventManagement::Artist < ApplicationModel
  attribute :artist

  def self.create!(args)
    new(artist: Artist.create!(args))
  end

end
