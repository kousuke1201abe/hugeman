class EventManagement::Nightclub < ApplicationModel

def create!(args)
  new(nightclub: Nightclub.create!(args))
end

end
