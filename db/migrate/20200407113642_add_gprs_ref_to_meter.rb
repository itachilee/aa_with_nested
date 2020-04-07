class AddGprsRefToMeter < ActiveRecord::Migration[5.2]
  def change
    add_column :meters,:gpr_id,:integer
  end
end
