class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :confirm_email]

  def create
    register_service = Register.new(params.require(:user).permit(:first_name,
                                          :last_name, :email, :is_company,
                                          :password, :password_confirmation))
    respond register_service.call
  end

  def show
    respond Success.new(current_user)
  end

  def update
    if current_user.update(params.permit(:first_name, last_name))
      respond Success.new(user: current_user)
    else
      respond :Error.new(current_user.errors.full_messages)
    end
  end

  def confirm_email
    confirm_email_service = ConfirmEmail.new params[:token]
    response = confirm_email_service.call
    if response.success?
      redirect_to 'http://localhost:3000/login.html'
    else
      render html: "<strong>Confirm email fail</strong>".html_safe
    end
  end

end
