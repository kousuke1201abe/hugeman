Event.find_by!(name: "test_club").tap do |event|
  event.images.find_or_create_by!(url: "test.jpg")
end
