class SubcategoriesController < ApplicationController


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

end