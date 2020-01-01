Nightclub.first.tap do |nightclub|
  nightclub.events.find_or_create_by!(name: "test_club") do |event|
    event.tag = "#test_tag"
    event.start_at = Time.zone.now
    event.end_at = Time.zone.now.since(1.day)
  end
end
