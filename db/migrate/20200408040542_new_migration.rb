class NewMigration < ActiveRecord::Migration[5.2]
  def  self.up
    add_column :admin_users,:sign_in_count,:integer,default: 0
    add_column :admin_users,:current_sign_in_at,:datetime
    add_column :admin_users,:last_sign_in_at,:datetime
    add_column :admin_users,:current_sign_in_ip,:inet
    add_column :admin_users,:last_sign_in_ip,:inet
  end
  def self.down
    remove_column :admin_users,:sign_in_count
    remove_column :admin_users,:current_sign_in_at
    remove_column :admin_users,:last_sign_in_at
    remove_column :admin_users,:current_sign_in_ip
    remove_column :admin_users,:last_sign_in_ip
  end
end
