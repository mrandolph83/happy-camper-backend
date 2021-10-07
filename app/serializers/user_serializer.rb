class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username

  has_many :reviews, serializer: ReviewSerializer
end

