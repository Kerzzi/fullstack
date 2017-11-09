class SyllabusesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
  layout "course"
  
  def index
    @course = Course.find(params[:course_id])
    @syllabus = @course.syllabus
  end
  
  def new
    @course = Course.find(params[:course_id])
    @syllabus = Syllabus.new
  end

  def create
    @course = Course.find(params[:course_id])
    @syllabus = Syllabus.new(syllabus_params)
    @syllabus.course = @course

    if @syllabus.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  private

  def syllabus_params
    params.require(:syllabus).permit(:content)
  end
end
