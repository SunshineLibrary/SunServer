class StatsController < ApplicationController
  
  include StatsHelper
  
  def choose_section_and_class
  end
  
  def section_by_class
    @classroom = Classroom.find(params[:classroom_id])
    @section = Section.find(params[:section_id])
  end
  
  def quiz_by_class
    @classroom = Classroom.find(params[:classroom_id])
    @section = Section.find(params[:section_id])
    @quiz_activity = Activity.find(params[:quiz_id])
    @problems = @quiz_activity.problems
  end
  
  def get_classrooms_from_school
    @school = School.find(params[:school_id])
    render :partial => 'shared/classroom_list', :locals => { :school => @school }
  end
  
  def get_sections_from_course
    @course = Course.find(params[:course_id])
    render :partial => 'shared/section_list', :locals => { :course => @course }
  end
  
end
