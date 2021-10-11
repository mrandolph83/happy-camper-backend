class RemoveStreetAddressAndUpdateFromRecArea < ActiveRecord::Migration[6.1]
  def change
    change_table :rec_areas do |t|
      t.remove :street_address, :city, :state, :zip_code
      t.string :city_state
      t.string :latitude
      t.string :longitude
      t.string :url
      t.string :activities
    end
  end
end
