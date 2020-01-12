Event.all.each.with_index do |event, i|
  event.artist_identifyings.find_or_create_by!(artist: Artist.first)
end
