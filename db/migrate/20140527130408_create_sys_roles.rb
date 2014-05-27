class CreateSysRoles < ActiveRecord::Migration
  def change
    create_table :sys_roles do |t|
      t.string :roleName
      t.string :remark

      t.timestamps
    end
  end
end
