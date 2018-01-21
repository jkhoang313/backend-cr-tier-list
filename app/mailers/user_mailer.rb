class UserMailer < ApplicationMailer
  default from: ENV["SUPPORT_FROM_EMAIL"]

  def reset_password_email(user, temp_password)
    @user = user
    @temp_password = temp_password
    mail(to: user.email_address, subject: 'Password was reset')
  end
end
