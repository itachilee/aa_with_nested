class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :ancestry

      t.timestamps
    end
    add_index :pages, :ancestry
  end
end
