class AdminController < ApplicationController
    before_action :authenticate_user!

    def index
        @accounts = User.where(admin:false)
    end

    def show
    end
end
