class ChangeMonthToBeDateInReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :date, :date
    remove_column :reviews, :month
    remove_column :reviews, :year
    
  end
end
