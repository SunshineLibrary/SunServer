class QuizComponentsController < ApplicationController
  def index
    @quiz_components = QuizComponent.all

    respond_to do |format|
      format.html
      format.json {render :json => @quiz_components}
    end
  end

  def new
    @quiz_component = QuizComponent.new

    respond_to do |format|
      format.html
      format.json {render :json => @quiz_component}
    end
  end

  def show
    @quiz_component = QuizComponent.find_by_id(params[:id])

    respond_to do |format|
      format.html
      format.json {render :json => @quiz_component}
    end
  end

  def create
    @quiz_component = QuizComponent.new(params[:quiz_component])

    respond_to do |format|
      if @quiz_component.save
        format.html  { redirect_to(@quiz_component, :notice => 'Post was successfully created.') }
        format.json  { render :json => @quiz_component, :status => :created, :location => @quiz_component }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @quiz_component.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @quiz_component = QuizComponent.find(params[:id])
  end

  def update
    @quiz_component = QuizComponent.find_by_id(params[:id])

    respond_to do |format|
      if @quiz_component.update_attributes(params[:quiz_component])
        format.html  { redirect_to(@quiz_component, :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @quiz_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz_component = QuizComponent.find(params[:id])
    @quiz_component.destroy

    respond_to do |format|
      format.html { redirect_to QuizComponents_url }
      format.json { head :no_content }
    end
  end
end
