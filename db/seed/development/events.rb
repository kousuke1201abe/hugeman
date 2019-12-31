Nightclub.first.tap do |nightclub|
  nightclub.find_or_create_by!(name: ("test_event")) do |event|
    event.tag = "#test_tag"
  end
end
