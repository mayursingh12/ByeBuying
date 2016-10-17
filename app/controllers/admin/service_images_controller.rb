class Admin::ServiceImagesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_service

  before_action :set_service_image, only: [:destroy]

  def destroy
    @service_image.destroy!
    redirect_to admin_service_path(@service)
  end

  private

  def set_service
    @service = Service.find params[:service_id]
  end

  def set_service_image
    @service_image = ServiceImage.find params[:id]
  end

end