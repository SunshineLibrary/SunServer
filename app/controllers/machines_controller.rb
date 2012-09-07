#encoding: UTF-8
class MachinesController < ApplicationController

  def index
    if current_admin.is_global
      @machines = Machines.all
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

end
