Event.find_by!(name: "test_club").tap do |event|
  event.tweets.find_or_create_by!(url: "https://twitter.com/test")
end
