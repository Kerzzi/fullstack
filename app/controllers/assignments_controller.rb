class AssignmentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
  layout "course"
  
  def index
    @course = Course.find(params[:course_id])
    @assignment = @course.assignment
  end
  
  def new
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  def create
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.course = @course

    if @assignment.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  private

  def assignment_params
    params.require(:assignment).permit(:content)
  end  
end
