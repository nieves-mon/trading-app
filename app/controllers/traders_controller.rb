class TradersController < ApplicationController
  before_action :initialize_iex_client
  before_action :authorize_trader

  def portfolio
    @user_stocks = current_user.user_stocks.where("quantity > ?", 0)

    begin
      @quotes = @user_stocks.map { |user_stock| @client.quote(user_stock.stock.symbol)}
    rescue IEX::Errors::SymbolNotFoundError
      flash[:danger] = "Symbol not found. Please input a valid symbol."
      render :new
    end

    @total_amount = 0
    @user_stocks.each_with_index { |stock, i| @total_amount += stock.quantity * @quotes[i].latest_price}
  end

  def trending_stocks
    @trending_stocks = @client.stock_market_list(:mostactive)
  end

  def transactions
    @transactions = current_user.transactions.order(created_at: :desc)
  end

end
