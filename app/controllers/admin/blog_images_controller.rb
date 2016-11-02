class Admin::BlogImagesController < Admin::BaseController

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

  private

  def blog_image_params
    params.require(:advertisement_image).permit(:image)
  end

end