class Stock < ApplicationRecord
    has_many :transactions, dependent: :delete_all
    has_many :users, through: :transactions
    has_many :user_stocks, dependent: :delete_all

    validates :symbol, :name, presence: true

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
