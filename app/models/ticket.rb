class Ticket < ActiveRecord::Base
    belongs_to :flight
    belongs_to :passenger, optional: true
    scope :cheapest, -> { order(price: :asc) }
    scope :expensive, -> { order(price: :desc) }
end 
