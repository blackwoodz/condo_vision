class CreateTenancies < ActiveRecord::Migration
  def change
    create_table :tenancies do |t|
      t.integer :tenant_id
      t.integer :unit_id
      t.date :start_date
      t.date :end_date

      t.timestamps

    end
  end
end
