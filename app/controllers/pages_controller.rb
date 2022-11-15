class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_access

    def home
    end
end
