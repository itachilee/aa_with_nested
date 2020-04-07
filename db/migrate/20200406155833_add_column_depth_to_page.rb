class AddColumnDepthToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :ancestry_depth,:integer,:default => 0
  end
end
