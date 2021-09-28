class AddRecAreaIdToRecAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :rec_areas, :rec_area_id, :integer
  end
end
