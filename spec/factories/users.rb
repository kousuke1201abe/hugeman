FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user #{n}" }
    sequence(:email) { |n| "test_email#{n}@hugeman.com" }
  end
end
