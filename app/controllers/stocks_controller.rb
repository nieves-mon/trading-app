class StocksController < ApplicationController
    before_action :initialize_iex_client
    before_action :authorize_trader

    def new
    end

    def show
        @stock = Stock.find_by(symbol: params[:symbol])
        @user_stock = current_user.user_stocks.find_by(stock: @stock)
        @shares = @user_stock.try(:quantity) || 0
    end

    def search
        begin
	        @quote = @client.quote(params[:symbol])

            @stock = Stock.find_by(symbol: params[:symbol])

            if @stock.nil?
                @stock = Stock.new
                @stock.symbol = @quote.symbol
                @stock.name = @quote.company_name
                @stock.save
            end

            redirect_to stock_path(@stock.symbol)
        rescue IEX::Errors::SymbolNotFoundError
            flash[:danger] = "Symbol not found. Please input a valid symbol."
            render :new
        end
    end
end
