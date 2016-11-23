class ChangeDuesDelinquentDefaultValueInOwnerships < ActiveRecord::Migration[5.0]
  def change
    change_column_default :ownerships, :dues_delinquent, 'false'
  end
end
