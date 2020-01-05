Event.find_by!(name: "test_club").tap do |event|
  event.artist_identifyings.find_or_create_by!(artist: Artist.first)
end