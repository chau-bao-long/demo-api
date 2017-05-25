class RefreshToken
  def initialize params
    @params = params
  end

  def call
    token = AccessToken.find_by_refresh_token @params
    if token.nil? || !token.regenerate_access_token
      Error.new I18n.t('api.invalid_refresh_token')
    else
      Success.new token
    end
  end
end