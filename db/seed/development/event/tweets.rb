Event.all.each.with_index do |event, i|
  event.tweets.find_or_create_by!(url: "1231591290741182470")
end
