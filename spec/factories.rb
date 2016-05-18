FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :item do
    sequence(:description) { |n| "Description #{n}" }
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'f4k3p455w0rd'
  end
end
