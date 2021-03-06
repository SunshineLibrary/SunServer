# encoding: UTF-8

class VideoActivitiesController < ApplicationController

  # GET /video_activities/1/edit
  def edit
    @video_activity = VideoActivity.find_by_id(params[:id])
    @section_id = params[:section_id]
  end

  # POST /video_activities
  # POST /video_activities.json
  def create
    @video_activity = VideoActivity.new(params[:video_activity])
    section = Section.find_by_id(params[:section_id])
    respond_to do |format|
      if (@video_activity.save)
        SectionComponent.create(section_id: section.id, activity_id: @video_activity.id, seq: section.activities.size + 1)
        format.html { redirect_to edit_video_activity_path(@video_activity, :section_id => section.id), notice: '成功创建视频环节，请上传视频文件' }
        format.json { render json: section, status: :created, location: section }
      else
        format.html { redirect_to section, notice: '出现错误，请重试' }
        format.json { render json: @video_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_activities/1
  # PUT /video_activities/1.json
  def update
    @video_activity = VideoActivity.find_by_id(params[:id])

    attr = params[:video_activity]
    section_id = attr[:section_id]
    attr.delete(:section_id)

    respond_to do |format|
      if @video_activity.update_attributes(attr)
        format.html { redirect_to Section.find_by_id(section_id), notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_activities/1
  # DELETE /video_activities/1.json
  def destroy
    @video_activity = VideoActivity.find(params[:id])
    @video_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
