class ChangeStatusDefaultValueInPayments < ActiveRecord::Migration[5.0]
  def change
    change_column_default :payments, :status, 'Pending'
  end
end
