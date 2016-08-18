class Customer::ProductImagesController < Customer::BaseController

  before_action :set_product

  before_action :set_product_image, only: [:destroy]

  # before_action :set_header_categories
  before_action :set_categories

  def new

  end

  def create
    @product_image = @product.product_images.new(product_image_params)
    if @product_image.save
      flash[:success] = 'Image added successfully'
      redirect_to customer_product_path(@product)
    else
      render template: 'customer/products/show'
    end
  end

  def destroy
    @product_image.destroy!
    redirect_to customer_product_path(@product)
  end

  private

  def set_product
    @product = Product.find params[:product_id]
  end

  def set_product_image
    @product_image = ProductImage.find params[:id]
  end

  def product_image_params
    params.require(:product_image).permit(
        :image
    )
  end

end