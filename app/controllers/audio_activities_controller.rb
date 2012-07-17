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
    @audio_activity = AudioActivity.new(params[:audio_activity])

    respond_to do |format|
      if @audio_activity.save
        format.html { redirect_to @audio_activity, notice: 'Audio activity was successfully created.' }
        format.json { render json: @audio_activity, status: :created, location: @audio_activity }
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
