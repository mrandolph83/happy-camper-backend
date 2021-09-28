class ReviewSerializer
  include JSONAPI::Serializer
  attributes :description, :picture, :date
end
