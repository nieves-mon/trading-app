class ApplicationController < ActionController::Base
    private

    def admin_acess
        if current_user.admin
            redirect_to accounts_path
        else
            redirect_to traders_dashboard_path
        end
    end

    def initialize_iex_client
        @client = IEX::Api::Client.new
    end
end
