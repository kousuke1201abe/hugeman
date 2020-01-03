Event.find_by!(name: "test_club").tap do |event|
  event.images || event.create_image!(name: "test.jpg")
end
