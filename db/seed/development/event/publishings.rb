User.first.tap do |user|
  user.events.each do |event|
    event.publishing || event.create_publishing!
  end
end
