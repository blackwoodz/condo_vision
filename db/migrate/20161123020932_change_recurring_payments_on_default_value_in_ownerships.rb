class ChangeRecurringPaymentsOnDefaultValueInOwnerships < ActiveRecord::Migration[5.0]
  def change
    change_column_default :ownerships, :recurring_payments_on, 'false'
  end
end
