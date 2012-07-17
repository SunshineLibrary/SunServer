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
    @text_activity = TextActivity.find(params[:id])
  end

  # POST /text_activities
  # POST /text_activities.json
  def create
    @text_activity = TextActivity.new(params[:text_activity])

    respond_to do |format|
      if @text_activity.save
        format.html { redirect_to @text_activity, notice: 'Text activity was successfully created.' }
        format.json { render json: @text_activity, status: :created, location: @text_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @text_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_activities/1
  # PUT /text_activities/1.json
  def update
    @text_activity = TextActivity.find(params[:id])

    respond_to do |format|
      if @text_activity.update_attributes(params[:text_activity])
        format.html { redirect_to @text_activity, notice: 'Text activity was successfully updated.' }
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
      format.html { redirect_to text_activities_url }
      format.json { head :ok }
    end
  end
end
