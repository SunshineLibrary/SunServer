# encoding: UTF-8
class ClassroomsController < ApplicationController

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.json
  def new
    @classroom = Classroom.new
    @school = School.find_by_id(params[:school_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    Classroom.prepare_params(params[:classroom])
    @classroom = Classroom.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: '成功创建班级' }
        format.json { render json: @classroom, status: :created, location: @classroom }
      else
        format.html { render action: "new" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])
    Classroom.prepare_params(params[:classroom])

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to @classroom, notice: '已更新班级信息' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @school = School.find_by_id(params[:school_id])
    @classroom = Classroom.find_by_id(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to school_path(@school) }
      format.json { head :ok }
    end
  end
end
