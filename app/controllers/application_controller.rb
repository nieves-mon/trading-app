class ApplicationController < ActionController::Base

    def admin_access
        if current_user.admin
            redirect_to accounts_path
        else
            redirect_to traders_dashboard_path
        end
    end

    def authorize_admin
        render status: 401 unless current_user.admin
    end

    def authorize_trader
        render root_path unless current_user.admin == false
    end

    def initialize_iex_client
        @client = IEX::Api::Client.new
    end
end
