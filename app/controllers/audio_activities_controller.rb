# encoding: UTF-8
class AudioActivitiesController < ApplicationController
  
  # GET /audio_activities/1/edit
  def edit
    @audio_activity = AudioActivity.find(params[:id])
    @section_id = params[:section_id]
  end

  # POST /audio_activities
  # POST /audio_activities.json
  def create
    @audio_activity = AudioActivity.new(params[:audio_activity])
    section = Section.find_by_id(params[:section_id])

    respond_to do |format|
      if (@audio_activity.save)
        SectionComponent.create(section_id: section.id, activity_id: @audio_activity.id, seq: section.activities.size + 1)
        format.html { redirect_to edit_audio_activity_path(@audio_activity, :section_id => section.id), notice: '成功创建音频环节，请上传音频 文件' }
        format.json { render json: section, status: :created, location: section }
      else
        format.html { redirect_to section, notice: '出现错误，请重试' }
        format.json { render json: @audio_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audio_activities/1
  # PUT /audio_activities/1.json
  def update
    @audio_activity = AudioActivity.find_by_id(params[:id])

    attr = params[:audio_activity]
    section_id = attr[:section_id]
    attr.delete(:section_id)

    respond_to do |format|
      if @audio_activity.update_attributes(attr)
        format.html { redirect_to Section.find_by_id(section_id), notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_activities/1
  # DELETE /audio_activities/1.json
  def destroy
    @audio_activity = VideoActivity.find(params[:id])
    @audio_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
