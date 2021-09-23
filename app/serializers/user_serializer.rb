class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :user_favorites_id
end
