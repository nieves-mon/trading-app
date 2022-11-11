class Stock < ApplicationRecord
    has_many :transactions
    has_many :users, through :transactions

    def self.search(symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:publishable_token],
            secret_token: Rails.application.credentials.iex_client[:secret_token],
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            company_name = client.company(symbol).company_name
            latest_price = client.quote(symbol).latest_price
            [new(symbol: symbol, name: company_name, price: latest_price), "success"]
        rescue IEX::Errors::SymbolNotFoundError
            [nil, "Symbol not found. Please input a valid symbol."]
        rescue
            [nil, "Something went wrong. Please try again."]
        end
    end
end
