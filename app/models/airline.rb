class Airline < ActiveRecord::Base 
    has_many :flights
    has_many :passengers, through: :flights
end
