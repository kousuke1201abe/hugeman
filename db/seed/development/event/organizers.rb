Event.find_by!(name: "test_club").tap do |event|
  event.organizers.find_or_create_by!(url: "test organizer")
end
