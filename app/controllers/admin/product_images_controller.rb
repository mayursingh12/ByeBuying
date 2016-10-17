class Admin::ProductImagesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_product

  before_action :set_product_image, only: [:destroy]

  def destroy
    @product_image.destroy!
    redirect_to admin_product_path(@product)
  end

  private

  def set_product
    @product = Product.find params[:product_id]
  end

  def set_product_image
    @product_image = ProductImage.find params[:id]
  end

  # def product_image_params
  #   params.require(:product_image).permit(
  #       :image
  #   )
  # end

end