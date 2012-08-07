class ProblemChoicesController < ApplicationController
  def index
    @problem_choices = ProblemChoice.all

    respond_to do |format|
      format.html
      format.json { render json: @problem_choices }
    end
  end
end
