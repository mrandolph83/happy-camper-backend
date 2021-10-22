class ReviewSerializer
  include JSONAPI::Serializer

  
  attributes :description, :picture, :user_id, :rec_area_id, :date, :nature_review, :amenities_review, :activities_review, :family_review
  belongs_to :rec_area, serializer: RecAreaSerializer
  # attribute :rec_area do |review|
  #   {
  #     rec_name: review.rec_area.name,
  #     rec_description: review.rec_area.description,
     
  #   }
  # end
end 
