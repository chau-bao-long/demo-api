class Register

  def initialize(params)
    @params = params
  end

  def call
    user = User.new(first_name: @params['first_name'],
                    last_name: @params['last_name'],
                    email: @params['email'],
                    is_company: @params['is_company'],
                    password: @params['password'],
                    password_confirmation: @params['password_confirmation'])
    if user.save
      SendEmailJob.perform_later user
      Success.new
    else
      Error.new user.errors
    end
  end

end
