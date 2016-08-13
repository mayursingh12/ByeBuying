class Admin::ProductsController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_product, only: [:show, :update_rating, :admin_approve, :destroy]

  def index
    @products = Product.all
  end

  def show

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

  def update_rating
   if @product.update_attributes(rating: params[:rating])
     flash[:success] = 'Rating successfully updated.'
     redirect_to action: :show

   else
     render action: :show
   end
  end

  def destroy
    @product.destroy
    redirect_to action: :index
  end

  def admin_approve
    if @product.update_attribute(:admin_verified, params[:admin_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
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
                                    :per_hour_price,
                                    :per_day_price,
                                    :per_week_price,
                                    :per_month_price,
                                    # :rent,
                                    :quantity,
                                    # :price_in_rupees,
                                    :negotiable,
                                    :refundable_security,
                                    :cost_of_replacement,
                                    :youtube_link,
                                    :other).merge(user_id: current_user.id)
  end

end