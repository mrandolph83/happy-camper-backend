class RecAreaSerializer
  include JSONAPI::Serializer
  
  attributes :name, :description, :city, :state

  has_many :reviews, serializer: ReviewSerializer
end
