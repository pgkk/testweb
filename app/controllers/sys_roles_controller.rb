class SysRolesController < ApplicationController

  before_action :set_sys_role, only: [:show, :edit, :update, :destroy]

  layout  "main"

  #前往列表页
  def index
    if params[:search] != ''
      @sys_roles = SysRole.where("roleName LIKE '%#{params[:search]}%'")
        .paginate(:page => params[:page] || 1, :per_page => 5)
    else
      @sys_roles = SysRole.paginate(:page => params[:page] || 1, :per_page => 5)
    end
  end

  #前往新增页
  def new
    @sys_role = SysRole.new
  end

  #新增
  def create
    @sys_role = SysRole.new(sys_role_params)
    #保存
    if @sys_role.save
      redirect_to sys_roles_url
    else
      render :new
    end
  end

  #前往修改
  def edit
  end

  #修改
  def update
    if @sys_role.update(sys_role_params)
      redirect_to sys_roles_url
    else
      render :edit
    end
  end

  #删除
  def destroy
    @sys_role.destroy
    redirect_to sys_roles_url
  end


  private
    def set_sys_role
      @sys_role = SysRole.find(params[:id])
    end

    def sys_role_params
      params.require(:sys_role).permit(:roleName, :remark)
    end

end
