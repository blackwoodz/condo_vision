class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :unit_id
      t.string :status
      t.float :amount
      t.integer :owner_id
      t.string :assessment_type

      t.timestamps

    end
  end
end
