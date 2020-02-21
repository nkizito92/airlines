class Passenger < ActiveRecord::Base
    validates :full_name, :age, presence: true
    has_many :tickets
    has_many :flights, through: :tickets
    belongs_to :user

end
