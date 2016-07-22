class Customer::AdvertisementImagesController < Customer::BaseController

  before_action :set_advertisement

  before_action :set_advertisement_image, only: [:destroy]

  before_action :set_header_categories

  def new

  end

  def create
    @advertisement_image = @advertisement.advertisement_images.new(advertisement_image_params)
    if @advertisement_image.save
      flash[:success] = 'Image added successfully'
      redirect_to customer_advertisement_path(@advertisement)
    else
      render template: 'customer/advertisements/show'
    end
  end

  def destroy
    @advertisement_image.destroy!
    redirect_to customer_advertisement_path(@advertisement)
  end

  private

  def set_advertisement
    @advertisement = Advertisement.find params[:advertisement_id]
  end

  def set_advertisement_image
    @advertisement_image = AdvertisementImage.find params[:id]
  end

  def advertisement_image_params
    params.require(:advertisement_image).permit(
        :image
    )
  end

end