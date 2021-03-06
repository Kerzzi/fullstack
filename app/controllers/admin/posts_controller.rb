class Admin::PostsController < Admin::BaseController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy
    
    redirect_to admin_posts_path
  end
    
  private
  
  def post_params
    params.require(:post).permit(:title, :description)
  end
  
end
