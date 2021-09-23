class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :user_favorites
    has_many :rec_areas, through: :user_favorites

end
