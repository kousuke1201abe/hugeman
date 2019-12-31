FactoryBot.define do
  factory :events, class: Nightclub do
    nightclub
    event_name { "test_evetnt_A" }
    tag { "#test_tag_A" }
    start_at { Time.now }
    end_at { Time.now+60 }
  end
end
