FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :item do
    sequence(:description) { |n| "Description #{n}" }
  end
end
