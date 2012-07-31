class ProblemsController < ApplicationController

  def show
    @problem = Problem.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @problem }
    end
  end
  
  
  def create
    @problem = Problem.new(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @problem = Problem.find(params[:id])
    @quiz_activity = QuizActivity.find(params[:quiz_activity_id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to @quiz_activity }
        format.json { head :ok }
      else
        format.html { render action: "show" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :ok }
    end
  end
  
  
  def add_choice
    respond_to do |format|
      format.js { render :partial => "problem_choice"} 
    end
  end
  
end
