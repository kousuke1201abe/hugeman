FactoryBot.define do
  factory :artist do
    sequence(:name){|n| "test_artist_#{n}"}
  end
end
