class Customer::ProductsController < Customer::BaseController

  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = 'successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def set_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit(:name,
                                    :gender,
                                    :category_id,
                                    :subcategory_id,
                                    :description,
                                    :technical_specification,
                                    :state_id,
                                    :city_id,
                                    :location,
                                    :start_at,
                                    :end_at,
                                    :rent,
                                    :refundable_security,
                                    :cost_of_replacement,
                                    :youtube_link,
                                    :other)
  end

end