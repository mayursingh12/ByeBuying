class SubcategoriesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  before_action :set_subcategory, only: [:show]

  def show
    @products = @subcategory.products.where(admin_verified: true).last(50)
    @services = @subcategory.services.where(admin_verified: true).last(50)
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

end