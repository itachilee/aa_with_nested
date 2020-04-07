class CreateGprs < ActiveRecord::Migration[5.2]
  def change
    create_table :gprs do |t|
      t.string :name
      t.string :no

      t.timestamps
    end
  end
end
