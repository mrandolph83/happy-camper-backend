class RecAreaSerializer
  include JSONAPI::Serializer
  
  set_id :id
  attributes :name, :description, :state, :images, :latitude, :longitude, :activities
 
  has_many :reviews, serializer: ReviewSerializer
end
