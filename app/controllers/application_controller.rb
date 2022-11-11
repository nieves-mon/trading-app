class ApplicationController < ActionController::Base

    private
    
    def admin_acess
        if current_user.admin?
            redirect_to accounts_path
        end
    end

end
