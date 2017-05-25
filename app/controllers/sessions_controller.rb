class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def login
    login_service = Login.new(params.permit(:name, :email, :password))
    respond login_service.call
  end

  def refresh_token
    respond RefreshToken.new(params[:refresh_token]).call
  end

end
