class SessionsController < ApplicationController
  before_action :validate_params, :only => [:validate]

  #登录页面
  def login
  end

  #登录验证
  def validate
    if(flash[:errormsg])
      redirect_to login_path
    end
    @user = SysUser.authenticate(params[:name], params[:password])
    if @user
      session[:user_name] = @user.name
      session[:user_email] = @user.email
      flash[:notice] = "#{@user.name}，欢迎您！TIME: #{DateTime.parse(Time.now.to_s).strftime('%Y-%m-%d %H:%M:%S').to_s}"
      redirect_to home_path
    else
      flash[:errormsg] = "用户名或密码错误!"
      redirect_to login_path
    end
  end

  #登出
  def logout
    session[:user_name] = nil
    session[:user_email] = nil
    redirect_to login_path
  end

private
  #参数验证
  def validate_params
    if !params[:name]
      flash[:errormsg] = "用户名不能为空"
    elsif !params[:password]
      flash[:errormsg] = "密码不能为空"
    else
    end
  end

end