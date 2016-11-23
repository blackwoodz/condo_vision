class ChangeSiteAdminDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :site_admin, 'false'
  end
end
