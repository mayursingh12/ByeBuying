class ProductsController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  before_action :set_product

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