class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :title
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
