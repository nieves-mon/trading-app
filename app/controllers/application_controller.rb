class ApplicationController < ActionController::Base
private

    def authorize_admin
        render status: 401 unless current_user.admin
    end

    def authorize_trader
        render status: 401 if current_user.admin
    end

    def initialize_iex_client
        @client = IEX::Api::Client.new
    end
end
