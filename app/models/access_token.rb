class AccessToken < ApplicationRecord
  EXPIRES_IN_SEC = 30.days.to_i
  belongs_to :user
  has_secure_token :access_token
  has_secure_token :refresh_token

  def expired?
    updated_at + expires_in * 1000 < DateTime.now
  end

end
