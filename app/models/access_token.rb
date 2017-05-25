class AccessToken < ApplicationRecord
  EXPIRES_IN_MILLIS = 30.days.to_i * 1000
  belongs_to :user
  has_secure_token :access_token
  has_secure_token :refresh_token

  def expired?
    updated_at + expires_in < DateTime.now
  end

end
