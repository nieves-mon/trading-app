class ApplicationMailer < ActionMailer::Base
  default from: Rails.credentials.google_smtp[:email]
  layout "mailer"
end
