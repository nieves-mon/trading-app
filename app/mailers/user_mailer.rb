class UserMailer < ApplicationMailer
    before_action :set_user

    def approved_email
        mail(to: @user.email, subject: 'TradeX: Account Approved')
    end

    private
        def set_user
            @user = params[:user]
        end
end
