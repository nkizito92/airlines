class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_num
      t.integer :price
      t.integer :seat_num

      t.timestamps
    end
  end
end
