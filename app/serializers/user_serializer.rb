class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :user_favorites_id

  has_many :reviews, serializer: ReviewSerializer
end

