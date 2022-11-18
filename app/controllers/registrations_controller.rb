class RegistrationsController < Devise::RegistrationsController
    private

        def after_inactive_sign_up_path_for(resource)
            flash[:notice] = "You will receive an email with instructions for how to confirm your email address in a few minutes."
            new_user_session_path
        end
end
