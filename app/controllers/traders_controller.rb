class TradersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_iex_client
  before_action :authorize_trader


  def portfolio
    @user_stocks = current_user.user_stocks.where("quantity > ?", 0)
  end

  def trending_stocks
    @trending_stocks = @client.stock_market_list(:mostactive)
  end

  def transactions
    @transactions = current_user.transactions.order(created_at: :desc)
  end

  private
  
  def authorize_trader
    render status: 401 if current_user.admin
  end

end
