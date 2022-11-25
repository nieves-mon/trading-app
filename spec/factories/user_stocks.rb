FactoryBot.define do
  factory :user_stock do
    association :user
    association :stock
  end
end
