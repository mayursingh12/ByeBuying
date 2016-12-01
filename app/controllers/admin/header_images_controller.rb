class Admin::HeaderImagesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_header

  def new

  end

  def create
    @header_image = @header.header_image.new(header_image_params)
    if @header_image.save
      flash[:success] = 'Image added successfully'
      redirect_to admin_header_path(@header)
    else
      render template: 'admin/headers/show'
    end
  end

  private

  def header_image_params
    params.require(:header_image).permit(
        :image
    )
  end

end