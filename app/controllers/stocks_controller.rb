class StocksController < ApplicationController
    before_action :initialize_iex_client

    def show
        @stock = Stock.find_by(symbol: params[:symbol])
    end

    def search
        begin
	        @quote = @client.quote(params[:symbol])

            @stock = Stock.find_by(symbol: params[:symbol])

            if @stock.nil?
                @stock = Stock.new
                @stock.symbol = @quote.symbol
                @stock.name = @quote.company_name
                @stock.price = @quote.latest_price
                @stock.save
            else
                @stock.update_attribute(:price, @quote.latest_price)
            end

            redirect_to stock_path(@stock.symbol)
        rescue IEX::Errors::SymbolNotFoundError
            flash[:danger] = "Symbol not found. Please input a valid symbol."
            render :new
        end
    end
end
