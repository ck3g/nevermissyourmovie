FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Movie ##{n}" }
    user

    trait :approved do
      state 'approved'
    end
  end
end
