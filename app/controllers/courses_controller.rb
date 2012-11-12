#encoding: UTF-8

class CoursesController < ApplicationController

  def lookup_permission course_id
    @permission = DownloadPermission.where(resource_id:course_id, resource_type:"Course").all
  end

  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end


  def show
    @course = Course.find(params[:id])
    @subject = @course.subject
    lookup_permission @course.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end


  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end


  def edit
    @course = Course.find_by_id(params[:id])
    lookup_permission @course.id
  end


  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        DownloadPermission.add_permission_from_params @course.id, "Course", true, params
        format.html { redirect_to @course, notice: '成功创建课程' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def eliminate_old_permission owner_type
    DownloadPermission.eliminate_old_permission @permission, owner_type, @course.id, "Course", params
  end

  def update_permission
    lookup_permission params[:id]

    eliminate_old_permission "School"
    eliminate_old_permission "Grade"
    eliminate_old_permission "Classroom"
    eliminate_old_permission "User"

    DownloadPermission.add_permission_from_params @course.id, "Course", true, params
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        update_permission

        format.html { redirect_to @course, notice: '已更新课程信息' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
