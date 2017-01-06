class Admin::HeaderImagesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_header

  before_action :set_header_image, only: [:destroy]

  def new

  end

  def create
    @header_image = @header.header_images.new(header_image_params)
    if @header_image.save
      flash[:success] = 'Image added successfully'
      redirect_to admin_header_path(@header)
    else
      render template: 'admin/headers/show'
    end
  end

  def destroy
    @header_image.destroy!
    redirect_to admin_header_path(@header)
  end

  private

  def set_header
    @header = Header.find params[:header_id]
  end

  def set_header_image
    @header_image = HeaderImage.find params[:id]
  end

  def header_image_params
    params.require(:header_image).permit(
        :image
    )
  end

end