class Admin::BlogsController < Admin::BaseController

  before_action :set_blog, only: [:edit, :destroy, :show]

  def index
    @blogs = Blog.all.order(:heading)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = 'Blog successfully created.'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:success] = 'Successfully updated.'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to action: :index
  end

  def show

  end

  private

  def set_blog
    @blog = Blog.find params[:id]
  end

  def blog_params
    params.require(:blog).permit(:heading,
                                 :description)
  end


end