class RemoveCityFromRecAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :rec_areas, :city, :string
  end
end
