class Passenger < ActiveRecord::Base
    has_many :tickets
    has_many :flights, through: :tickets

    def tickets_attrs=(tickets_attrs)
        tickets_attrs.values.each do |ticket_attr|
            ticket = Ticket.find_or_create_by(ticket_attr)
            self.tickets << ticket
        end
    end
end
