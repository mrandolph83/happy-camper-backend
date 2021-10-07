class RemoveUserFavoritesIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_favorites_id, :integer
  end
end
