class User < ActiveRecord::Base
    has_many :passengers
    validates :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, {length: { in: 6..12 }}
    has_secure_password
end
