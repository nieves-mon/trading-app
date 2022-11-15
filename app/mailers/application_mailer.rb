class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.google_smtp[:email]
  layout "mailer"
end
