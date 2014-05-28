class CreateSysUserRoles < ActiveRecord::Migration
  def change
    create_table :sys_user_roles do |t|

      t.integer :sys_user_id
      t.integer :sys_role_id
      
      t.timestamps
    end
  end
end
