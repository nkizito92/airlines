class Flight < ActiveRecord::Base
    has_many :tickets
    has_many :passengers, through: :tickets
    belongs_to :airline
    validates :departure, :arrival, :title, presence: true
    scope :cheapest, -> { order(price: :asc) }
    scope :expensive, -> { order(price: :desc) }
end