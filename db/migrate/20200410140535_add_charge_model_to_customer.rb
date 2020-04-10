class AddChargeModelToCustomer < ActiveRecord::Migration[5.2]
  def self.up
    add_column :customers,:charge_id,:integer
    add_index :customers,:charge_id
  end
  def self.down
    remove_column :customers,:charge_id,:integer
    remove_index :customers,:charge_id
  end
end
