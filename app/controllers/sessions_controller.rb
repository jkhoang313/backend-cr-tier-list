class SessionsController < ApplicationController
  def create
    user = User.find_by(email_address: params[:email_address].downcase)

    if user && user.authenticate(params[:password])
      jwt = Auth.encrypt({user_id: user.id})
      render json: {jwt: jwt, user: UserSerializer.new(user)}, root: nil
    else
      render json: {error: "Incorrect email or password"}, status: 400
    end
  end

  def show
    if current_user
      render json: UserSerializer.new(current_user), root: nil
    else
      render json: {}, status: 400
    end
  end
end
