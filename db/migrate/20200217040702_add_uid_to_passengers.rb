class AddUidToPassengers < ActiveRecord::Migration[6.0]
    add_column :passengers, :user_id, :integer
    add_column :passengers, :seats, :integer
end