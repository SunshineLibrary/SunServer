class HtmlActivitiesController < ApplicationController
  # GET /html_activities
  # GET /html_activities.json
  def index
    @html_activities = HtmlActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @html_activities }
    end
  end

  # GET /html_activities/1
  # GET /html_activities/1.json
  def show
    @html_activity = HtmlActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @html_activity }
    end
  end

  # GET /html_activities/new
  # GET /html_activities/new.json
  def new
    @html_activity = HtmlActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @html_activity }
    end
  end

  # GET /html_activities/1/edit
  def edit
    @html_activity = HtmlActivity.find(params[:id])
  end

  # POST /html_activities
  # POST /html_activities.json
  def create 
    @html_activity = HtmlActivity.new(params[:html_activity])
    @html_activity.sections << Section.find(params[:section_id])

    respond_to do |format|
      if (@html_activity.save)
        format.html { redirect_to Section.find_by_id(params[:section_id]), notice: 'Html activity was successfully created.' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @html_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /html_activities/1
  # PUT /html_activities/1.json
  def update
    @html_activity = HtmlActivity.find(params[:id])

    respond_to do |format|
      if @html_activity.update_attributes(params[:html_activity])
        format.html { redirect_to Section.find(params[:section_id]), notice: 'Html activity was successfully updated.' }
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
      format.html { redirect_to html_activities_url }
      format.json { head :ok }
    end
  end
end
