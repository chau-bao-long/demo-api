class Logout

  def initialize(current_user)
    @current_user = current_user
  end

  def call
    token = @current_user.access_token
    token.delete
    Success.new
  end
end