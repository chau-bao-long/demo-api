class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    UserMailer.registration_confirmation(user).deliver
  end
end
