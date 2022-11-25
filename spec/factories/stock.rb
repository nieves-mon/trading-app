FactoryBot.define do
    factory :stock, class: 'Stock' do
        symbol { 'AMZN' }
        name {'Amazon.com Inc.' }
    end

end
