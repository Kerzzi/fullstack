class FaqsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
  layout "course"
  
  def index
    @course = Course.find(params[:course_id])
    @faq = @course.faq
  end
  
  def new
    @course = Course.find(params[:course_id])
    @faq = Faq.new
  end

  def create
    @course = Course.find(params[:course_id])
    @faq = Faq.new(faq_params)
    @faq.course = @course

    if @faq.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  private

  def faq_params
    params.require(:faq).permit(:content)
  end
end
