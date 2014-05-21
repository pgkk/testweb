class CreateSysUsers < ActiveRecord::Migration
  def change
    create_table :sys_users do |t|
      t.string :name, :null => false, :limit => 20, :comment => 'user login name'
      t.string :pwd, :null => false, :limit => 32, :comment => 'user login password'
      t.string :photo, :limit => 100, :comment => 'user photo'
      t.string :phone, :limit => 20, :comment => 'user telphone,such as 13100000000 or 023-12345678'
      t.integer :sex, :default => 0, :comment => 'user gender, Male is 0，Female is 1'

      t.timestamps
    end
  end
end
