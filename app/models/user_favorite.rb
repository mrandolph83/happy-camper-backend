class UserFavorite < ApplicationRecord
    belongs_to :user
    belongs_to :rec_area
end
