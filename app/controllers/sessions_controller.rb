class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:login, :refresh_token]

  def login
    login_service = Login.new(params.require(:user).permit(:email, :password))
    respond login_service.call
  end

  def logout
    logout_service = Logout.new current_user
    respond logout_service.call
  end

  def refresh_token
    respond RefreshToken.new(params[:refresh_token]).call
  end

end
