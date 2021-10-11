class RemoveRecAreaIdFromRecAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :rec_areas, :rec_area_id, :integer

  end
end
