FactoryBot.define do
  factory :event_tweet, class: Event::Tweet do
    event
    url { "https://twitter.com/test" }
  end
end
