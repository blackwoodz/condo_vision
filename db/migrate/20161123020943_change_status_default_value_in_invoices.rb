class ChangeStatusDefaultValueInInvoices < ActiveRecord::Migration[5.0]
  def change
    change_column_default :invoices, :status, 'Unpaid'
  end
end
