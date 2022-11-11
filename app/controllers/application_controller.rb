class ApplicationController < ActionController::Base

    private
    
    def admin_acess
        if current_user.admin
            redirect_to accounts_path 
        else
            redirect_to traders_dashboard_path 
        end
    end
    
end
