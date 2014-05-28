class SysUsersController < ApplicationController
  before_action :set_sys_user, only: [:show, :edit, :update, :destroy]
  layout  "main"

  # GET /sys_users
  def index
    #@sys_users = SysUser.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    if params[:search] != ''
      @sys_users = SysUser.where("name LIKE '%#{params[:search]}%'")
        .paginate(:page => params[:page] || 1, :per_page => 5)
    else
      @sys_users = SysUser.paginate(:page => params[:page] || 1, :per_page => 5)
    end
  end

  # GET /sys_users/1
  def show
  end

  # GET /sys_users/new
  def new
    @sys_user = SysUser.new
  end

  # GET /sys_users/1/edit
  def edit
  end

  # POST /sys_users
  def create
    @sys_user = SysUser.new(sys_user_params)
    
    #保存
    if @sys_user.save

      #获取所有的角色关联，并删除
      user_roles = SysUserRole.find_by(:sys_user => @sys_user)
      if !user_roles.nil?
        if user_roles.class == SysUserRole
          user_roles.destroy
        else
          user_roles.each do |user_role|
            user_role.destroy
          end
        end
      end

      #添加角色关联
      role_ids = params[:sys_user][:sys_role_ids]
      if role_ids
        role_ids.each do |role_id|
          if !role_id.nil? &&!role_id.empty?
            SysUserRole.create :sys_user => @sys_user,
              :sys_role => SysRole.new(:id => role_id)
          end
        end
      end

      redirect_to sys_users_url
    else
      render :new
    end
  end

  # PATCH/PUT /sys_users/1
  def update
    if @sys_user.update(sys_user_params)
      #获取所有的角色关联，并删除
      user_roles = SysUserRole.find_by(:sys_user => @sys_user)
      if !user_roles.nil?
        if user_roles.class == SysUserRole
          user_roles.destroy
        else
          user_roles.each do |user_role|
            user_role.destroy
          end
        end
      end

      #添加角色关联
      role_ids = params[:sys_user][:sys_role_ids]
      if role_ids
        role_ids.each do |role_id|
          if !role_id.nil? &&!role_id.empty?
            SysUserRole.create :sys_user => @sys_user,
              :sys_role => SysRole.new(:id => role_id)
          end
        end
      end


      redirect_to sys_users_url
    else
      render :edit
    end
  end

  # DELETE /sys_users/1
  def destroy
    @sys_user.destroy
    redirect_to sys_users_url
  end

  private
    def set_sys_user
      @sys_user = SysUser.find(params[:id])
    end

    def sys_user_params
      params.require(:sys_user).permit(:name, :password, :photo, :phone, :sex, :email)
    end
end
