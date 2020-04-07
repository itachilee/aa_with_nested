class CreateMeters < ActiveRecord::Migration[5.2]
  def change
    create_table :meters do |t|
      t.string :name
      t.integer :no,default: 0

      t.timestamps
    end
  end
end
