FactoryBot.define do
  factory :nightclub do
    sequence(:name) { |n| "test_nightclib name#{n}" }
  end
end
