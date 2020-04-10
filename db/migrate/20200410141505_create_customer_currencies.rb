class CreateCustomerCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_currencies do |t|
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
