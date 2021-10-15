class ReviewSerializer
  include JSONAPI::Serializer

  
  attributes :description, :picture, :date, :user_id, :rec_area_id, :nature_review, :amenities_review, :activities_review, :family_review

  belongs_to :rec_area, serializer: RecAreaSerializer
end 
