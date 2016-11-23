class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :unit_number
      t.float :monthly_dues

      t.timestamps

    end
  end
end
