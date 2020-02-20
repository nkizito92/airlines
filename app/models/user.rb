class User < ActiveRecord::Base
    has_many :passengers
    validates :username, :password, presence: true 
    has_secure_password
end
