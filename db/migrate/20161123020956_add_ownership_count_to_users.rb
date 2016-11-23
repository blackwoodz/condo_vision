class AddOwnershipCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ownerships_count, :integer
  end
end
