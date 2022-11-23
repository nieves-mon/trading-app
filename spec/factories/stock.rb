FactoryBot.define do
    factory :stock, class: 'Stock' do
        symbol { 'AMZN' }
        name {'Amazon.com Inc.' }
        price { 100 }
    end

end