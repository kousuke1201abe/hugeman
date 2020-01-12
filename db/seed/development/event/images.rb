Event.all.each.with_index do |event, i|
  event.images.find_or_create_by!(url: "test#{i+1}.jpg")
end
