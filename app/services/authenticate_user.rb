class AuthenticateUser

  def initialize(request)
    @request = request
  end

  def call
    if @request.authorization.nil?
      Error.new I18n.t('api.unauth')
    else
      header_auth = @request.authorization.split(' ')
      access_token = AccessToken.find_by_access_token(header_auth[1])
      if access_token.nil? || header_auth[0] != 'Bearer'
        Error.new I18n.t('api.invalid_access_token'), :unauthorized
      elsif access_token.expired?
        Error.new I18n.t('api.access_token_is_expired'), :unauthorized
      else
        Success.new access_token.user
      end
    end
  end
end
