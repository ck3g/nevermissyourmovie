FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Movie ##{n}" }
    user
  end
end
