class AudioActivitiesController < ApplicationController
  # GET /audio_activities
  # GET /audio_activities.json
  def index
    @audio_activities = AudioActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audio_activities }
    end
  end

  # GET /audio_activities/1
  # GET /audio_activities/1.json
  def show
    @audio_activity = AudioActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audio_activity }
    end
  end

  # GET /audio_activities/new
  # GET /audio_activities/new.json
  def new
    @audio_activity = AudioActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio_activity }
    end
  end

  # GET /audio_activities/1/edit
  def edit
    @audio_activity = AudioActivity.find(params[:id])
  end

  # POST /audio_activities
  # POST /audio_activities.json
  def create
    @activity = Activity.new
    @activity.tipe = "audio"
    @activity.order = params[:order].to_i+1
    
    if(!@activity.save)
      format.html { redirect_to Section.find_by_id(params[:section_id], notice: 'Could not create new Activity.') }
      format.json { render json: @activity.errors, status: :unprocessable_entity }
      return
    end
    
    @audio_activity = AudioActivity.new(params[:audio_activity])
    @audio_activity.activity_id = @activity.id
    @activity.sections << Section.where(params[:section_id])

    respond_to do |format|
      if (@audio_activity.save && @activity.save)
        format.html { redirect_to Section.find_by_id(params[:section_id]), notice: 'Audio activity was successfully created.' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @audio_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audio_activities/1
  # PUT /audio_activities/1.json
  def update
    @audio_activity = AudioActivity.find(params[:id])

    respond_to do |format|
      if @audio_activity.update_attributes(params[:audio_activity])
        format.html { redirect_to @audio_activity, notice: 'Audio activity was successfully updated.' }
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
    @audio_activity = AudioActivity.find(params[:id])
    @audio_activity.destroy

    respond_to do |format|
      format.html { redirect_to audio_activities_url }
      format.json { head :ok }
    end
  end
end
