class RemoveUserFavoritesIdFromRecAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :rec_areas, :user_favorites_id, :integer
  end
end
