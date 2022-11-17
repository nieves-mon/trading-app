class Stock < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions
    has_many :user_stocks

    validates :symbol, :name, :price, presence: true

    def quote
        begin
            client = IEX::Api::Client.new
            return client.quote(self.symbol)
        rescue IEX::Errors::SymbolNotFoundError
            flash[:danger] = "Symbol not found. Please input a valid symbol."
            render :back
        end
    end
end
