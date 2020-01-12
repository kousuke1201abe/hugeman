Event.all.each.with_index do |event, i|
  event.tweets.find_or_create_by!(url: "https://twitter.com/test#{ i+1 }")
end
