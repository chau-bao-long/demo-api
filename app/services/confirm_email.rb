class ConfirmEmail

  def initialize(confirm_token)
    @confirm_token = confirm_token
  end

  def call
    user = User.find_by_confirm_token(@confirm_token)
    if user
      user.email_activate
      Success.new user.generate_access_token
    else
      Error.new(I18n.t('api.wrong_confirm_token'))
    end
  end

end