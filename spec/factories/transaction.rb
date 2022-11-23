FactoryBot.define do
    factory :transaction, class: 'Transaction' do
      association :user
      association :stock
      price { 100 }
      quantity { 10 }
      amount {1000 }
    end

    trait :buy do
      kind { 0 }
    end
  
    trait :sell do
      kind { 1 }
    end
  end