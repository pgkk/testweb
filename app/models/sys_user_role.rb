class SysUserRole < ActiveRecord::Base
  belongs_to :sys_user
  belongs_to :sys_role

end
