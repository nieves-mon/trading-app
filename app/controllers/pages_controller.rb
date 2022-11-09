class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_acess
    def home
    end
end
