class Login

  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(email: @params['email']).try(:authenticate, @params['password'])
    if user.nil? || !user
      Error.new(I18n.t('api.email_password_wrong'))
    elsif !user.email_confirmed
      Error.new(I18n.t('api.need_confirm_email'))
    else
      token = user ? user.generate_access_token : nil
      if token.nil?
        Error.new(I18n.t('api.login_fail'))
      else
        Success.new(token)
      end
    end
  end

end
