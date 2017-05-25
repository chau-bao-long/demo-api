class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_create :confirmation_token
  has_one :access_token, dependent: :destroy

  has_secure_password

  validates :first_name, presence: true, length: {maximum: 20}
  validates :last_name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true

  def generate_access_token
    token = access_token
    if token.nil?
      token = build_access_token
    else
      token.regenerate_access_token
      token.regenerate_refresh_token
    end
    token.expires_in = AccessToken::EXPIRES_IN_SEC
    token.save ? access_token : nil
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
