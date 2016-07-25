class ProductsController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  before_action :set_product, only: [:show]

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show

  end

  private

  def set_header_categories
    @categories = Category.all
  end

  def set_product
    @product = Product.find params[:id]
  end


end