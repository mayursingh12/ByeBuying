class SubcategoriesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  before_action :set_subcategory, only: [:show]
  before_action :set_min_max_price, only: [:show]

  def show
    # where('price > ? AND price < ?', min, max)
    if params[:min_price].present? && params[:max_price].present?
      @products = @subcategory.products.where(admin_verified: true).where('price_in_rupees > ? AND price_in_rupees < ? OR price_in_rupees = ? OR price_in_rupees = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price])
      @services = @subcategory.services.where(admin_verified: true).where('price_in_rupees > ? AND price_in_rupees < ? OR price_in_rupees = ? OR price_in_rupees = ?' , params[:min_price], params[:max_price], params[:min_price], params[:max_price])
    else
      @products = @subcategory.products.where(admin_verified: true).last(50)
      @services = @subcategory.services.where(admin_verified: true).last(50)
    end

  end

  def get_subcategory
    if params[:gender].present?
      if params[:gender] == 'Male'
        @subcategories = Subcategory.where(category_id: params[:id], subcategory_type: params[:subcategory_type], male: true)
      else
        @subcategories = Subcategory.where(category_id: params[:id], subcategory_type: params[:subcategory_type], female: true)
      end
    else
      if params[:subcategory_type].present?
        @subcategories = Subcategory.where(category_id: params[:id], subcategory_type: params[:subcategory_type])
      else
        @subcategories = Subcategory.where(category_id: params[:id])
      end
    end
  end

  private

  def set_header_categories
    @categories = Category.all
  end

  def set_subcategory
    @subcategory = Subcategory.find params[:id]
  end

  def set_min_max_price
    product_min_price = Product.minimum(:price_in_rupees)
    product_max_price = Product.maximum(:price_in_rupees)

    service_min_price = Service.minimum(:price_in_rupees)
    service_max_price = Service.maximum(:price_in_rupees)

    @min_price = [product_min_price, service_min_price].min.to_i
    @max_price = [product_max_price, service_max_price].max.to_i

  end

end