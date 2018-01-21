class ApplicationMailer < ActionMailer::Base
  default from: ENV["SUPPORT_FROM_EMAIL"]
  layout 'mailer'
end
