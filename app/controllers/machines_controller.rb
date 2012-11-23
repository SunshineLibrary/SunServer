#encoding: UTF-8
class MachinesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:sign_in]
  skip_before_filter :admin_signed_in_required, :only => [:sign_in]
  respond_to :json, :only => [:sign_in]

  def index
    if current_admin.is_global
      @machines = Machine.all
    else
      @machines = current_admin.school.machines
    end

    respond_to do |format|
      format.html { @machines }
      format.json { render json: @machines }
    end
  end


  def show
    @machine = Machine.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @machine }
    end
  end


  def edit
    @machine = Machine.find(params[:id])
  end


  def update
    @machine = Machine.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:apk])
        format.html { redirect_to @machine, notice: '已更新机器信息' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end


  def lock
    @machine = Machine.find(params[:id])
    @machine.current_signin_record.sign_out if @machine.current_signin_record #sign out first
    @machine.lock
    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: '已锁定' }
        format.json { head :ok }
      else
        format.html { render action: @machine, notice: '未锁定成功，请重试' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  def unlock
    @machine = Machine.find(params[:id])
    @machine.unlock
    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: '已解锁' }
        format.json { head :ok }
      else
        format.html { render action: @machine, notice: '未解锁成功，请重试' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end


  def sign_in
    # store params
    machine_id = params[:machine_id]
    machine_android_version = params[:android_version]
    user_name = params[:name]
    user_type = params[:user_type]
    user_school_id = params[:school_id]
    user_grade = params[:grade]
    user_class = params[:class]
    user_birthday = params[:birthday]
    @user = nil
    @machine = nil
    @machine_signin = nil

    # search db for ojbects
    status = "OK"
    if @school = School.find_by_id(user_school_id)
      @user = User.find_by_type_school_grade_class_name_birthday(user_type, @school, user_grade, user_class, user_name, user_birthday)
      status = "Wrong params" if @user.nil?
    else
      status = "Wrong params"
    end

    # signin and return
    if status == "OK"
      # first check "loggability" of user
      if @user.current_signin_record
        if @user.current_signin_record.machine.unique_id == machine_id
          # app reinstalled or data cleaned up, continue previous signin session
          @machine_signin = @user.current_signin_record
          status = "Success"
        else
          # user currently signed in another machine
          status = "Signed in another device"
        end
      else
        # check "loggability" of the device
        if @machine = Machine.find_by_unique_id(machine_id)
          # known machine
          if @machine.is_locked
            status = "Machine locked"
          elsif @machine.current_signin_record
            # happen when machine app got reinstalled and another user tried to signin, previous user needs to sign out first
            status = "Machine already signed in"
          else
            status = "Ready for signin"
          end
        else
          # unknown machine, create first
          if @machine_type = MachineType.find_by_android_version(machine_android_version)
            @machine = Machine.create(unique_id: machine_id, machine_type_id: @machine_type.id)
          else
            # use unknown device type
            @machine = Machine.create(unique_id: machine_id, machine_type_id: MachineType.unknown_type)
          end
          status = "Ready for signin"
        end
      end
    end

    # sign in
    if status == "Ready for signin"
      @machine_signin = MachineSignin.new(:machine_id => @machine.id, :user_id => @user.id)
      @machine_signin.access_token = MachineSignin.calculate_access_token(@machine.unique_id, @user.id)
      if @machine_signin.save
        status = "Success"
      else
        status = "Internal error"
      end
    end

    case status
    when "Success"
      respond_with({status: "200", message: "登录成功！", access_token: @machine_signin.access_token}, :location => nil)
    when "Wrong params"
      respond_with({status: "400", message: "错误：登录信息不正确"}, :location => nil)
    when "Signed in another device"
      respond_with({status: "400", message: "错误：用户已登录到另一台设备上"}, :location => nil)
    when "Machine already signed in"
      respond_with({status: "400", message: "错误：设备已登录"}, :location => nil)
    when "Machine locked"
      respond_with({status: "400", message: "错误：设备已被锁定"}, :location => nil)
    when "Internal error"
      respond_with({status: "500", message: "错误：请重试"}, :location => nil)
    end
  end

  def sign_out
    @machine = Machine.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])

    respond_to do |format|
      if @machine.current_signin_record.sign_out
        format.html { redirect_to @user, notice: '已登出' }
        format.json { head :ok }
      else
        format.html { redirect_to user_url(@user), notice: '登出出现错误' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

end
