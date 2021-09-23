class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :rec_area_id
      t.string :description
      t.string :month
      t.string :year
      t.string :picture

      t.timestamps
    end
  end
end
