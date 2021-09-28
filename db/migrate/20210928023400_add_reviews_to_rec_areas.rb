class AddReviewsToRecAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :nature_review, :integer
    add_column :reviews, :amenities_review, :integer
    add_column :reviews, :activities_review, :integer
    add_column :reviews, :family_review, :integer
  end
end
