class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    
    def dashboard
        @transactions = Transaction.all
    end
    
end
