class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :user_favorites_id

  has many :reviews, serializer: UserSerializer
end
