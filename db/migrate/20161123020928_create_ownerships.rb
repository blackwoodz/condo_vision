class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :owner_id
      t.integer :unit_id
      t.date :start_date
      t.date :end_date
      t.boolean :recurring_payments_on
      t.string :payment_token
      t.string :bank_authorization
      t.boolean :dues_delinquent

      t.timestamps

    end
  end
end
