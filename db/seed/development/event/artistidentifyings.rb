Event.find_by!(name: "test_club").tap do |event|
  event.tweets.find_or_create_by!(event_id: "#{number}")
  event.tweets.find_or_create_by!(artist_id: "#{number}")
end
