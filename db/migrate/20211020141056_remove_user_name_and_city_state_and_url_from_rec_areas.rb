class RemoveUserNameAndCityStateAndUrlFromRecAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :rec_areas, :city, :string
    remove_column :rec_areas, :state, :string
    remove_column :rec_areas, :url, :string

  end
end
