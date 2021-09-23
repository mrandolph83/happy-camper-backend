class CreateUserFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :user_favorites do |t|
      t.integer :user_id
      t.integer :rec_area_id

      t.timestamps
    end
  end
end
