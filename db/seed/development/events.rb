30.times do |i|
  User.first.tap do |user|
    user.events.find_or_create_by!(name: "test event #{i+1}") do |event|
      event.tag = "#test_tag"
      event.start_at = Time.zone.now
      event.end_at = Time.zone.now.since(1.day)
      event.nightclub = Nightclub.first
    end
  end
end
