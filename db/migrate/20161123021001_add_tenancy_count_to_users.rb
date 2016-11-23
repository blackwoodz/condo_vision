class AddTenancyCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tenancies_count, :integer
  end
end
