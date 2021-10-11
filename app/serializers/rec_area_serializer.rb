class RecAreaSerializer
  include JSONAPI::Serializer
  
  set_id :id
  attributes :name, :description, :city_state, :images, :latitude, :longitude, :url, :activities
 

  has_many :reviews, serializer: ReviewSerializer
end
