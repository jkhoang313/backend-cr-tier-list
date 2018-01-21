class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      jwt = Auth.encrypt({ user_id: @user.id })
      render json: { jwt: jwt, user: UserSerializer.new(@user) }, root: false
    else
      render json: { error: "A user with this email address has already been created." }, status: 400
    end
  end

  def update
    if params.include? "change_password"
      if current_user.authenticate(password_params["current_password"])
        update_successful = current_user.update(password_params.permit(:password, :password_confirmation))

        if !update_successful
          return render json: { error: "Current password is incorrect."}, status: 400
        end
      else
        return render json: { error: "Current password is incorrect."}, status: 400
      end
    end

    render json: UserSerializer.new(current_user), root: nil
  end

  private
  def user_params
    params.permit(:email_address, :first_name, :last_name, :password, :password_confirmation)
  end

  def password_params
    params.require(:change_password)
  end
end
