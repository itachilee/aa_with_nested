class CreateCollectors < ActiveRecord::Migration[5.2]
  def change
    create_table :collectors do |t|
      t.string :name
      t.string :no
      t.references :gpr, foreign_key: true

      t.timestamps
    end
  end
end
