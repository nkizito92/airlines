class AddUidToUsers < ActiveRecord::Migration[6.0]
    add_column :users, :uid, :string
end