class PagesController < ApplicationController
    before_action :authenticate_user!

    def home
        if current_user.admin
            redirect_to accounts_path
        else
            redirect_to traders_portfolio_path
        end
    end
end
