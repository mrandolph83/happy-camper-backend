class RecAreaSerializer
  include JSONAPI::Serializer
  
  set_id :id
  attributes :name, :description, :state, :images, :latitude, :longitude, :activities, :reviews
 
  # has_many :reviews, serializer: ReviewSerializer

end
