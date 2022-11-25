class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_trader
    before_action :set_stock
    before_action :initialize_iex_client, except: [:save_transaction]
    before_action :get_quote, except: [:save_transaction]

    def buy_stock
        @transaction = Transaction.new

    end

    def sell_stock
        @transaction = Transaction.new
        @user_stock = current_user.user_stocks.find_or_initialize_by(stock: @stock)
    end

    def save_transaction
        @transaction = current_user.transactions.build(transaction_params)
        @transaction.amount = transaction_params[:quantity].to_i * transaction_params[:price].to_f

        if @transaction.save
            @user_stock = current_user.user_stocks.find_by(stock: @stock)

            if @user_stock
                new_quantity = @user_stock.quantity
                @transaction.buy? ? new_quantity += @transaction.quantity : new_quantity -= @transaction.quantity
                @user_stock.update(stock: @stock, quantity: new_quantity)
            else
                @user_stock = current_user.user_stocks.build(stock: @stock, quantity: @transaction.quantity)
                @user_stock.save
            end

            flash[:success] = "You successfully #{@transaction.buy? ? 'bought' : 'sold'} #{@transaction.quantity} share#{'s' if @transaction.quantity > 1} of #{@stock.symbol} stock!"
            redirect_to stock_path(@stock.symbol)
        else
            flash[:alert] = "Something went wrong"
            render :buy_stock
        end
    end

    private
        def transaction_params
            params.require(:transaction).permit(:kind, :quantity, :price, :stock_id)
        end

        def set_stock
            @stock = Stock.find_by(symbol: params[:symbol])
        end

        def get_quote
            @quote = @client.quote(@stock.symbol)
        end
end
