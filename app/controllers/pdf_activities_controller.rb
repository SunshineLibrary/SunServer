#encoding: UTF-8
class PdfActivitiesController < ApplicationController

  # GET /pdf_activities/1/edit
  def edit
    @pdf_activity = PdfActivity.find_by_id(params[:id])
    @section_id = params[:section_id]
  end

  # POST /pdf_activities
  # POST /pdf_activities.json
  def create
    @pdf_activity = PdfActivity.new(params[:pdf_activity])
    section = Section.find_by_id(params[:section_id])
    respond_to do |format|
      if @pdf_activity.save
        SectionComponent.create(section_id: section.id, activity_id: @pdf_activity.id, seq: section.activities.size + 1)
        format.html { redirect_to edit_pdf_activity_path(@pdf_activity, :section_id => section.id), notice: 'Pdf环节成功创建' }
        format.json { render json: section, status: :created, location: section }
      else
        format.html { redirect_to section, notice: '出现错误，请重试' }
        format.json { render json: @pdf_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pdf_activities/1
  # PUT /pdf_activities/1.json
  def update
    @pdf_activity = PdfActivity.find_by_id(params[:id])

    attr = params[:pdf_activity]
    section_id = attr[:section_id]
    attr.delete(:section_id)

    respond_to do |format|
      if @pdf_activity.update_attributes(attr)
        @pdf_activity.gen_cutted_pdf
        format.html { redirect_to Section.find_by_id(section_id), notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdf_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_activities/1
  # DELETE /pdf_activities/1.json
  def destroy
    @pdf_activity = PdfActivity.find(params[:id])
    @pdf_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
