class ProblemsController < ApplicationController

  def show
    @problem = Problem.find(params[:id])
    @quiz_activity = QuizActivity.find_by_id(params[:quiz_activity_id])
    @section_id = params[:section_id]
    
    respond_to do |format|
      format.html
      format.json { render json: @problem }
    end
  end
  
  
  def create
    @problem = Problem.new(params[:problem])
    @problem.tipe = params[:tipe]
    @quiz_activity = QuizActivity.find_by_id(params[:quiz_activity_id])
    @section_id = params[:section_id]

    respond_to do |format|
      if @quiz_activity.problems << @problem  
        format.html { redirect_to problem_path(@problem, :quiz_activity_id => @quiz_activity.id, :section_id => @section_id) }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def update
    @problem = Problem.find(params[:id])
    @quiz_activity = QuizActivity.find(params[:quiz_activity_id])
    @section_id = params[:section_id]

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to quiz_activity_path(@quiz_activity, :section_id => @section_id) }
        format.json { head :ok }
      else
        format.html { render action: "show" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :ok }
    end
  end
  
  
  def add_choice
    respond_to do |format|
      format.js { render :partial => "problem_choice"} 
    end
  end
  
end