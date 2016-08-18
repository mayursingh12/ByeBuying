class Customer::ProductsController < Customer::BaseController

  before_action :set_product, only: [:edit, :update, :show, :destroy]

  # before_action :set_header_categories
  before_action :set_categories

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if request.format == 'application/json'
      if @product.save
        render status: :ok, json: {success: 'successfully saved.'}
      else
        render status: :unprocessable_entity, json: { errors: @product.errors.full_messages }
      end
    else
      if @product.save
        flash[:success] = 'Product successfully created'
        redirect_to action: :index
      else
        render action: :new
      end
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

  def show

  end

  def destroy
    @product.destroy
    redirect_to action: :index
  end

  private

  def set_product
    @product = current_user.products.find params[:id]
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
                                    # :rent,
                                    :quantity,
                                    :per_hour_price,
                                    :per_day_price,
                                    :per_week_price,
                                    :per_month_price,
                                    # :price_in_rupees,
                                    :negotiable,
                                    :refundable_security,
                                    :cost_of_replacement,
                                    :youtube_link,
                                    :other).merge(user_id: current_user.id)
  end

end