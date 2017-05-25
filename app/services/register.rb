class Register

  def initialize(params)
    @params = params
  end

  def call
    user = User.new(name: @params['name'], email: @params['email'],
                    password: @params['password'],
                    password_confirmation: @params['password_confirmation'])
    if user.save
      Success.new user.generate_access_token
    else
      Error.new I18n.t('api.register_fail')
    end
  end

end
