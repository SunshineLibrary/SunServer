class SectionComponentsController < ApplicationController
  def index
    @section_components = SectionComponent.all

    respond_to do |format|
      format.html
      format.json {render :json => @section_components}
    end
  end

  def new
    @section_component = SectionComponent.new

    respond_to do |format|
      format.html
      format.json {render :json => @section_component}
    end
  end

  def show
    @section_component = SectionComponent.find_by_id(params[:id])

    respond_to do |format|
      format.html
      format.json {render :json => @section_component}
    end
  end

  def create
    @section_component = SectionComponent.new(params[:section_component])

    respond_to do |format|
      if @section_component.save
        format.html  { redirect_to(@section_component, :notice => 'Post was successfully created.') }
        format.json  { render :json => @section_component, :status => :created, :location => @section_component }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @section_component.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @section_component = SectionComponent.find(params[:id])
  end

  def update
    @section_component = SectionComponent.find_by_id(params[:id])

    respond_to do |format|
      if @section_component.update_attributes(params[:section_component])
        format.html  { redirect_to(@section_component, :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @section_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @section_component = SectionComponent.find(params[:id])
    @section_component.destroy

    respond_to do |format|
      format.html { redirect_to SectionComponents_url }
      format.json { head :no_content }
    end
  end
end
