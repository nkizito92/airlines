class Ticket < ActiveRecord::Base
    belongs_to :flight
    belongs_to :passenger, optional: true
    scope :cheapest, -> { order(price: :asc) }
    scope :expensive, -> { order(price: :desc) }
    scope :expensive_tickets, -> { where('price > 1000') }
    validates :seat_num, :ticket_num, presence: true
    validates :price, numericality: { :greater_than_or_equal_to => 0 }
end 
