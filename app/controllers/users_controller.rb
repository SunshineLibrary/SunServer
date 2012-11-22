#encoding: UTF-8

require 'csv' 

class UsersController < ApplicationController

  include MachinesHelper

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @machine = @user.current_machine

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    case params[:user_type]
      when "student"
        @user.user_type = "student"
        @user.classroom_id = params[:classroom_id]
      when "teacher"
        @user.user_type = "teacher"
        @user.school_id = params[:school_id]
      else      
        redirect_to @user, notice: '用户类型不正确，请重试'
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.user_type == "student"
      classroom = Classroom.find_by_id(@user.classroom_id)
      @user.school_id = classroom.school.id
    end    
    birthday = params[:year] + "-" + params[:month] + "-" + params[:day]
    @user.birthday = birthday
    respond_to do |format|
      if @user.save
        if @user.is_student
          format.html { redirect_to @user.classroom, notice: '成功创建用户' }
        elsif @user.is_teacher
          format.html { redirect_to @user.school, notice: '成功创建用户' }
        end
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    back_url = nil
    if @user.is_student
        back_url = @user.classroom
    else
        back_url = @user.school
    end
    @user.destroy

    respond_to do |format|
      format.html { redirect_to back_url }
      format.json { head :ok }
    end
  end
  
  # for SunBook
  def sign_in
    @user = User.find(params[:id])
    @user.hard_destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  # for batch create users
  def batch_new
  end

  def batch_create
    f = params[:csv].read
    rows = CSV.parse(f)
    rows = rows[1..-1] # skip header line
    n = 0
    rows.each do |row|
      u = User.new
      u.name = row[0].force_encoding('UTF-8')
      u.birthday = row[1]
      u.classroom_id = row[2]
      u.school_id = row[3]
      u.user_type = row[4]
      n = n + 1 if u.save
    end
    respond_to do |format|
      format.html { redirect_to({:action => 'batch_new'}, :notice => "成功添加#{n}位学生") }
      format.json { head :ok }
    end
  end

  
end
