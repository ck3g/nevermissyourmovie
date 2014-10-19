FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "addicted-to-#{n}@example.com"}
    password 'password'
  end

end
