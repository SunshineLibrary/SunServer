class VideoActivitiesController < ApplicationController
  # GET /video_activities
  # GET /video_activities.json
  def index
    @video_activities = VideoActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_activities }
    end
  end

  # GET /video_activities/1
  # GET /video_activities/1.json
  def show    
    @video_activity = VideoActivity.find(params[:id])
    @section_id = params[:section_id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_activity }
    end
  end

  # GET /video_activities/new
  # GET /video_activities/new.json
  def new
    @video_activity = VideoActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_activity }
    end
  end

  # GET /video_activities/1/edit
  def edit    
    @video_activity = VideoActivity.find(params[:id])
    @section_id = params[:section_id]
  end

  # POST /video_activities
  # POST /video_activities.json
  def create
    @video_activity = VideoActivity.new(params[:video_activity])
    @video_activity.sections << Section.find(params[:section_id])
      
    respond_to do |format|
      if (@video_activity.save)
        format.html { redirect_to Section.find_by_id(params[:section_id]), notice: 'Video activity was successfully created.' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @video_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_activities/1
  # PUT /video_activities/1.json
  def update
    @video_activity = VideoActivity.find(params[:id])

    respond_to do |format|
      if @video_activity.update_attributes(params[:video_activity])
        format.html { redirect_to Section.find(params[:section_id]), notice: 'Video activity was successfully updated.' }
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
      format.html { redirect_to video_activities_url }
      format.json { head :ok }
    end
  end
end
