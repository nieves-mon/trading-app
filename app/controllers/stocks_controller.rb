class StocksController < ApplicationController
    before_action :initialize_iex_client

    def new
    end

    def search
        begin
	        @quote = @client.quote(params[:symbol])
        rescue IEX::Errors::SymbolNotFoundError
            @error = "Symbol not found. Please input a valid symbol."
        rescue
            @error = "Something went wrong. Please try again."
        end
    end
end
