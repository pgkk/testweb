class SysUsersController < ApplicationController
  before_action :set_sys_user, only: [:show, :edit, :update, :destroy]
  layout  "main"

  # GET /sys_users
  # GET /sys_users.json
  def index
    @sys_users = SysUser.all.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /sys_users/1
  # GET /sys_users/1.json
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
  # POST /sys_users.json
  def create
    @sys_user = SysUser.new(sys_user_params)

    respond_to do |format|
      if @sys_user.save
        format.html { redirect_to sys_users_url, notice: '新增用户成功！' }
        format.json { render :show, status: :created, location: @sys_user }
      else
        format.html { render :new }
        format.json { render json: @sys_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sys_users/1
  # PATCH/PUT /sys_users/1.json
  def update
    respond_to do |format|
      if @sys_user.update(sys_user_params)
        format.html { redirect_to sys_users_url, notice: '用户资料更新成功！' }
        format.json { render :show, status: :ok, location: @sys_user }
      else
        format.html { render :edit }
        format.json { render json: @sys_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sys_users/1
  # DELETE /sys_users/1.json
  def destroy
    @sys_user.destroy
    respond_to do |format|
      format.html { redirect_to sys_users_url, notice: '成功删除用户！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sys_user
      @sys_user = SysUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sys_user_params
      params.require(:sys_user).permit(:name, :pwd, :photo, :phone, :sex)
    end
end
