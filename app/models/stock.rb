class Stock < ApplicationRecord
    def self.search(symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:publishable_token],
            secret_token: Rails.application.credentials.iex_client[:secret_token],
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            company_name = client.company(symbol).company_name
            latest_price = client.quote(symbol).latest_price
            new(symbol: symbol, name: company_name, price: latest_price)
        rescue IEX::Errors::SymbolNotFoundError
            nil
        end
    end
end
