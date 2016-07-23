class Admin::ProductsController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_product, only: [:show, :update_rating, :admin_approve]

  def index
    @products = Product.all
  end

  def show

  end

  def update_rating
   if @product.update_attributes(rating: params[:rating])
     flash[:success] = 'Rating successfully updated.'
     redirect_to action: :show

   else
     render action: :show
   end
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

end