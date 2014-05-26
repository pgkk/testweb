class SysUser < ActiveRecord::Base
  validates_uniqueness_of :name, {:allow_nil => true, :message => '用户名已存在！'}
  validates_length_of :pwd, {:allow_nil => true, :minimum => 6, :message => '密码最小长度为6位'}
  validates_presence_of :sex, :message=> "性别不能为空"

  #联系方式屏蔽部分字符
  def phone_str
    return "" if self.phone.blank? || self.phone.length < 11
    str = self.phone
    str[3]=str[4]=str[5]=str[6]="*"
    return str
  end

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    gennerate_password(pass)      
  end

  #登录验证
  def self.authenticate(name,password)
    user = SysUser.find_by(:name => name)
    if user && Digest::SHA256.hexdigest(password + user.hashcode) == user.pwd
      return user
    else
      return nil
    end
  end

  private
  #密码生成
  def gennerate_password(pass)
    salt = Array.new(12){rand(2048).to_s(36)}.join
    self.hashcode, self.pwd = salt, Digest::SHA256.hexdigest(pass + salt)
  end
end
