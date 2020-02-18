class AddIdsToTickets < ActiveRecord::Migration[6.0]
    add_column :tickets, :passenger_id, :integer
    add_column :tickets, :flight_id, :integer
end