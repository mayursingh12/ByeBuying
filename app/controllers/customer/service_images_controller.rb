class Customer::ServiceImagesController < Customer::BaseController

  before_action :set_service

  before_action :set_service_image, only: [:destroy]

  before_action :set_header_categories

  def new

  end

  def create
    @service_image = @service.service_images.new(service_image_params)
    if @service_image.save
      flash[:success] = 'Image added successfully'
      redirect_to customer_service_path(@service)
    else
      render template: 'customer/services/show'
    end
  end

  def destroy
    @service_image.destroy!
    redirect_to customer_service_path(@service)
  end

  private

  def set_service
    @service = Service.find params[:service_id]
  end

  def set_service_image
    @service_image = ServiceImage.find params[:id]
  end

  def service_image_params
    params.require(:service_image).permit(
        :image
    )
  end

end