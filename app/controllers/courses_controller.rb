class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  
  def show
    @course = Course.find(params[:id])
  end
  
  def index
    @courses = Course.all
  end
  
  private
  
  def course_params
    params.require(:course).permit(:title, :description)
  end
end
