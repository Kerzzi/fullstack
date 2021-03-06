class Admin::CoursesController < Admin::BaseController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @course = Course.find(params[:id])
  end
  
  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end
  
  # 新建课程的时候，将faq等页面一起建立，参考rails 百宝箱 嵌套表单 10-1
  
  def create
    @course = Course.new(course_params)
    
    if @course.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    
    if @course.update(course_params)
      redirect_to admin_courses_path
    else
      render :edit
    end
  end
  
  def destroy
    @course = Course.find(params[:id])
    
    @course.destroy
    
    redirect_to admin_courses_path
  end
  
  private
  
  def course_params
    params.require(:course).permit(:title, :description)
  end
end
