class AddFactoryIdToMeter < ActiveRecord::Migration[5.2]
  def self.up
    add_column :meters, :factory_id, :integer
    add_index :meters,:factory_id
  end

  def self.down
    remove_column :meters, :factory_id, :integer
    remove_index :meters,:factory_id
  end
end
