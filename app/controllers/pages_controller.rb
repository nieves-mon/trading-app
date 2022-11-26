class PagesController < ApplicationController
    def home
        if current_user.admin
            redirect_to accounts_path
        else
            redirect_to traders_portfolio_path
        end
    end
end
