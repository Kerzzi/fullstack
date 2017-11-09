class ActivitiesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
  layout "course"
  
  def index
    @course = Course.find(params[:course_id])
    @activity = @course.activity
  end
  
  def new
    @course = Course.find(params[:course_id])
    @activity = Activity.new
  end

  def create
    @course = Course.find(params[:course_id])
    @activity = Activity.new(activity_params)
    @activity.course = @course

    if @activity.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  private

  def activity_params
    params.require(:activity).permit(:content)
  end  
end
