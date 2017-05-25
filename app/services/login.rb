class Login

  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(email: @params['email']).try(:authenticate, @params['password'])
    token = user ? user.generate_access_token : nil
    if token.nil?
      Error.new(I18n.t('api.login_fail'))
    else
      Success.new(token)
    end
  end

end
