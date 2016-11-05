class Admin::BlogImagesController < Admin::BaseController

  before_action :set_blog

  before_action :set_blog_image, only: [:destroy]

  def new

  end

  def create
    @blog_image = @blog.blog_images.new(blog_image_params)
      if @blog_image.save
        flash[:success] = 'Image added successfully'
        redirect_to admin_blog_path(@blog)
      else
        render template: 'admin/blogs/show'
      end
  end

  def destroy
    @blog_image.destroy!
    redirect_to admin_blog_path(@blog)
  end

  private

  def set_blog
    @blog = Blog.find params[:blog_id]
  end

  def set_blog_image
    @blog_image = BlogImage.find params[:id]
  end

  def blog_image_params
    params.require(:blog_image).permit(
        :image
    )
  end

end