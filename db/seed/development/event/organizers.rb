Event::Organizer.create!(name: "test organizer").tap do |event|
  event.organizers.find_or_create_by!(url: "test organizer")
end
