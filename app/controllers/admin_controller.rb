class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_access
    
    def index
    end
end
