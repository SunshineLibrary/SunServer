class GalleryActivitiesController < ApplicationController
  # GET /gallery_activities
  # GET /gallery_activities.json
  def index
    @gallery_activities = GalleryActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gallery_activities }
    end
  end

  # GET /gallery_activities/1
  # GET /gallery_activities/1.json
  def show
    @gallery_activity = GalleryActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery_activity }
    end
  end

  # GET /gallery_activities/new
  # GET /gallery_activities/new.json
  def new
    @gallery_activity = GalleryActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery_activity }
    end
  end

  # GET /gallery_activities/1/edit
  def edit
    @gallery_activity = GalleryActivity.find(params[:id])
  end

  # POST /gallery_activities
  # POST /gallery_activities.json
  def create
    @gallery_activity = GalleryActivity.new(params[:gallery_activity])
    @gallery_activity.activity.sections << Section.find(params[:section_id])
      
    respond_to do |format|
      if (@gallery_activity.save)
        format.html { redirect_to Section.find_by_id(params[:section_id]), notice: 'Gallery activity was successfully created.' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_activities/1
  # PUT /gallery_activities/1.json
  def update
    @gallery_activity = GalleryActivity.find(params[:id])

    respond_to do |format|
      if @gallery_activity.update_attributes(params[:gallery_activity])
        format.html { redirect_to Section.find(params[:section_id]), notice: 'Gallery activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_activities/1
  # DELETE /gallery_activities/1.json
  def destroy
    @gallery_activity = GalleryActivity.find(params[:id])
    @gallery_activity.destroy

    respond_to do |format|
      format.html { redirect_to gallery_activities_url }
      format.json { head :ok }
    end
  end
end
