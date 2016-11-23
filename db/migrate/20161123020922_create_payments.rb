class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.float :amount
      t.string :status

      t.timestamps

    end
  end
end
