class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :gprs_no
      t.string :water_no
      t.string :meter_no
      t.string :customer_no
      t.string :customer_id

      t.timestamps
    end
  end
end
