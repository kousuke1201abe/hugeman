Event.all.each.with_index do |event, i|
  event.organizers.find_or_create_by!(name: "test organizer #{ i+1 }")
end
