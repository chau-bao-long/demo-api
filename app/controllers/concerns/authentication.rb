module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  private

  def authenticate_user
    result = AuthenticateUser.new(request).call
    if result.success?
      @current_user = result.data
    else
      respond result
    end
  end

end