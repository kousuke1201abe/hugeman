FactoryBot.define do
  factory :artists do
    sequence(:name){|n| "test_artist_#{n}"}
  end
end