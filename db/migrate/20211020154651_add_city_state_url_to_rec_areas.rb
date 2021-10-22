class AddCityStateUrlToRecAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :rec_areas, :city, :string
    add_column :rec_areas, :state, :string
    add_column :rec_areas, :url, :string
  end
end
