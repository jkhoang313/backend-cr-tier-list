class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  attr_reader :current_user

  def current_user
    user = nil
    token = request.headers['Auth-Token']
    if token
      begin
        user_info = Auth.decode(token)
        user = User.find(user_info['user_id'])
      rescue
      end
    end
    user
  end
end
