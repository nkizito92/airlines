class Passenger < ActiveRecord::Base
    validates :full_name, presence: true
    validates :age, numericality: { :greater_than_or_equal_to => 0 }
    has_many :tickets
    has_many :flights, through: :tickets
    belongs_to :user
end
