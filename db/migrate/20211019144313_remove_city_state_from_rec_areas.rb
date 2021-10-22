class RemoveCityStateFromRecAreas < ActiveRecord::Migration[6.1]
  def change
      remove_column :rec_areas, :city_state, :string
      add_column :rec_areas, :city, :string
      add_column :rec_areas, :state, :string

  end
end
