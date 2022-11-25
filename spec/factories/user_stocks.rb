FactoryBot.define do
  factory :user_stock do
    association :user
    association :stock
    quantity { 1 }
  end
end
