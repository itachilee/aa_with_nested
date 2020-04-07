class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :identityId
      t.string :phone
      t.boolean :gender
      t.string :address
      t.references :meter,foreign_key: true
      t.timestamps
    end
  end
end
