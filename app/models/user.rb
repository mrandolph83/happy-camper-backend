class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    
    has_many :rec_areas, through: :user_favorites

    validates :name, :username, presence: true  
    validates :username, uniqueness: true

end
