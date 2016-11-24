class ProductsController < ApplicationController

  layout 'default'

  # before_action :set_header_categories
  before_action :set_categories

  before_action :set_product, only: [:show]

  def index
    if request.format == 'application/json'
      @products = Product.where(admin_verified: true).all
    else
      @products = Product.where(admin_verified: true).all.paginate(:page => params[:page], :per_page => 20)
    end

  end

  def show

  end

  private

  # def set_header_categories
  #   @categories = Category.all
  # end

  def set_product
    @product = Product.where(admin_verified: true).find params[:id]
    if(!@product.recommand_count)
      @product.recommand_count = 0;
    end
    if(!@product.customer_review)
      @product.customer_review = 0;
    end
    if(!@product.average_rating)
      @product.average_rating = 0;
    end
    @ratings = @product.ratings
  end

end