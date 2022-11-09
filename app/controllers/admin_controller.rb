class AdminController < ApplicationController
    before_action :authenticate_user!

    def index
        @traders = User.where(admin:false)
    end
end
