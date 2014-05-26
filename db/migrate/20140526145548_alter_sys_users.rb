class AlterSysUsers < ActiveRecord::Migration
  def self.up
    add_column :sys_users, :email, :string, :limit => 50, :comment => 'email'
    add_column :sys_users, :hashcode, :string, :limit => 50, :comment => 'hashcode'
    change_column :sys_users, :pwd, :string, :null => false, :limit => 100, :comment => 'user login password'
  end

  def self.down
    remove_column :sys_users, :email
    remove_column :sys_users, :hashcode
  end

end
