class CreateChargeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :charge_logs do |t|

      t.timestamps
    end
  end
end
