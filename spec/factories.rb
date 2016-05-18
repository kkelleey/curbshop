FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :item do
    sequence(:description) { |n| "Description #{n}" }

    factory :item_with_user do
      user
    end
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'f4k3p455w0rd'

    factory :user_with_item do
      after(:create) do |user|
        create(:item, user: user)
      end
    end
  end
end
