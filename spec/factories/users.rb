FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "addicted-to-#{n}@example.com"}
    password 'password'

    factory :user_example_com do
      email 'user@example.com'
    end

    trait :admin do
      roles [:admin]
    end
  end

end
