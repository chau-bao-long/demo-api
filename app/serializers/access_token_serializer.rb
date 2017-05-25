class AccessTokenSerializer < ActiveModel::Serializer
  attributes :access_token, :expires_in, :refresh_token
end
