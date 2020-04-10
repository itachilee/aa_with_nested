class AddCmdcodeToOrder < ActiveRecord::Migration[5.2]
  def self.up
    add_column :orders,:cmdcode,:integer
  end
  def self.down
    remove_column :orders,:cmdcode,:integer

  end
end
