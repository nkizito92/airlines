class Ticket < ActiveRecord::Base
    belongs_to :flight
    belongs_to :passenger, optional: true
    scope :cheapest, -> { order(price: :asc) }
    scope :expensive, -> { order(price: :desc) }
    validates :seat_num, :ticket_num, :flight_id, presence: true
end 
