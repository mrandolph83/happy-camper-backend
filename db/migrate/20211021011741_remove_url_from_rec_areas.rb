class RemoveUrlFromRecAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :rec_areas, :url, :string
  end
end
