class User < ApplicationRecord
  has_one :access_token, dependent: :destroy

  has_secure_password

  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true

  def generate_access_token
    token = access_token || build_access_token
    token.expires_in = AccessToken::EXPIRES_IN_MILLIS
    token.save ? user.access_token : nil
  end

end
