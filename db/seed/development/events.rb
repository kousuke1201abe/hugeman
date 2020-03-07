30.times do |i|
  User.first.tap do |user|
    user.events.find_or_create_by!(name: "first user test event #{i+1}") do |event|
      event.tag = "#test_tag#{i+1}"
      event.start_at = Time.zone.now
      event.end_at = Time.zone.now.since(1.day)
      event.nightclub = Nightclub.first
      event.url_code = SecureRandom.uuid
    end
  end
end

30.times do |i|
  User.second.tap do |user|
    user.events.find_or_create_by!(name: "second user test event #{i+1}") do |event|
      event.tag = "#test_tag#{i+1}"
      event.start_at = Time.zone.now
      event.end_at = Time.zone.now.since(1.day)
      event.nightclub = Nightclub.first
      event.url_code = SecureRandom.uuid
    end
  end
end
