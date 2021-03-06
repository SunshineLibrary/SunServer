#encoding: UTF-8
class TextActivitiesController < ApplicationController
  # GET /text_activities
  # GET /text_activities.json
  def index
    @text_activities = TextActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_activities }
    end
  end

  # GET /text_activities/1
  # GET /text_activities/1.json
  def show
    @text_activity = TextActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_activity }
    end
  end

  # GET /text_activities/new
  # GET /text_activities/new.json
  def new
    @text_activity = TextActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_activity }
    end
  end

  # GET /text_activities/1/edit
  def edit
    @text_activity = TextActivity.includes(:text_activity_content).find(params[:id])
    @section_id = params[:section_id]
  end

  # POST /text_activities
  # POST /text_activities.json
  def create
    @text_activity = TextActivity.new(params[:text_activity])
    section = Section.find_by_id(params[:section_id])

    respond_to do |format|
      if (@text_activity.save)
        SectionComponent.create(section_id: section.id, activity_id: @text_activity.id, seq: section.activities.size)
        format.html { redirect_to edit_text_activity_path(@text_activity, :section_id => section.id), notice: '成功创建环节' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @text_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_activities/1
  # PUT /text_activities/1.json
  def update
    @text_activity = TextActivity.find_by_id(params[:id])    

    attr = params[:text_activity]
    section_id = attr[:section_id]
    attr.delete(:section_id) 

    respond_to do |format|
      if @text_activity.update_attributes(attr)
        format.html { redirect_to Section.find(section_id), notice: 'Text activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_activities/1
  # DELETE /text_activities/1.json
  def destroy
    @text_activity = TextActivity.find(params[:id])
    @text_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
