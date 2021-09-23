class CreateRecAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :rec_areas do |t|
      t.string :name
      t.string :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :images
      t.integer :user_favorites_id

      t.timestamps
    end
  end
end
