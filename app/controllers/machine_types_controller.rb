# encoding: UTF-8
class MachineTypesController < ApplicationController
  def index
    @machine_types = MachineType.all
    
    respond_to do |format|
      format.html
      format.json {render :json => @machine_types}
    end
  end
  
  def new
    @machine_type = MachineType.new
    
    respond_to do |format|
      format.html
      format.json {render :json => @machine_type}
    end
  end
  
  def show
    @machine_type = MachineType.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json {render :json => @machine_type}
    end
  end
  
  def create
    @machine_type = MachineType.new(params[:machine_type])
 
    respond_to do |format|
      if @machine_type.save
        format.html  { redirect_to(machine_types_path,
                      :notice => '成功创建机器类型') }
        format.json  { render :json => @machine_type,
                      :status => :created, :location => @machine_type }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @machine_type.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @machine_type = MachineType.find(params[:id])
  end
  
  def update
    @machine_type = MachineType.find(params[:id])
   
    respond_to do |format|
      if @machine_type.update_attributes(params[:machine_type])
        format.html  { redirect_to(@machine_type,
                      :notice => '信息已更新') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @machine_type.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @machine_type = MachineType.find(params[:id])
    @machine_type.destroy
   
    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end
end
