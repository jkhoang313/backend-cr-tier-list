class SettingsController < ApplicationController
  def create
    email = params[:email_address]
    user = User.find_by(email_address: email.downcase)

    if user
      temp_password = user.set_random_password

      UserMailer.reset_password_email(user, temp_password).deliver_now

      render json: {success: "The account with the email #{email}'s password has been reset. Please check your email for your new password."}
    else
      render json: {error: "There is no account associated with the email #{email}"}, status: 400
    end
  end
end
