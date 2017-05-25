class UsersController < ApplicationController

  def create
    register_service = Register.new(params.permit(:name, :email,
                                          :password, :password_confirmation))
    respond register_service.call
  end

  def show
    respond Success.new(user: User.find(params.permit(:id)[:id]))
  end

  def update
    if current_user.update(params.permit(:name))
      respond Success.new(user: current_user)
    else
      respond Error.new(current_user.errors.full_messages)
    end
  end

end
