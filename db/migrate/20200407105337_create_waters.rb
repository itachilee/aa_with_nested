class CreateWaters < ActiveRecord::Migration[5.2]
  def change
    create_table :waters do |t|
      t.string :name
      t.string :no
      t.references :meter, foreign_key: true

      t.timestamps
    end
  end
end
