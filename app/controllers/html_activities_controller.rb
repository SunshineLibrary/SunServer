#encoding: UTF-8
class HtmlActivitiesController < ApplicationController

  # GET /html_activities/1/edit
  def edit
    @html_activity = HtmlActivity.find_by_id(params[:id])
    @section_id = params[:section_id]
  end

  # POST /html_activities
  # POST /html_activities.json
  def create 
    @html_activity = HtmlActivity.new(params[:html_activity])
    section = Section.find_by_id(params[:section_id])
    respond_to do |format|
      if (@html_activity.save)
        SectionComponent.create(section_id: section.id, activity_id: @html_activity.id, seq: section.activities.size + 1)
        format.html { redirect_to edit_html_activity_path(@html_activity, :section_id => section.id), notice: '成功创建网页环节，请上传网页压缩包' }
        format.json { render json: section, status: :created, location: section }
      else
        format.html { redirect_to section, notice: '出现错误，请重试' }
        format.json { render json: @html_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /html_activities/1
  # PUT /html_activities/1.json
  def update
    @html_activity = HtmlActivity.find(params[:id])
    
    attr = params[:html_activity]
    section_id = attr[:section_id]
    attr.delete(:section_id) 

    respond_to do |format|
      if @html_activity.update_attributes(params[:html_activity])
        format.html { redirect_to Section.find(section_id), notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @html_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /html_activities/1
  # DELETE /html_activities/1.json
  def destroy
    @html_activity = HtmlActivity.find(params[:id])
    @html_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
