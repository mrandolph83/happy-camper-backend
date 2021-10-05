class RecArea < ApplicationRecord
    # include AllowSettingIdOnCreate
    has_many :reviews
    has_many :user_favorites
    has_many :users, through: :user_favorites
end
