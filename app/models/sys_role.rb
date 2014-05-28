class SysRole < ActiveRecord::Base

  validates_uniqueness_of :roleName, {:message => '角色名称已存在！'}
  validates_presence_of :roleName, :message => '角色名称必填'

end
