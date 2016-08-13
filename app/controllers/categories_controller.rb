class CategoriesController < ApplicationController

  before_action :set_categories

  before_action :set_category, only: [:show]

  layout 'default'

  def index
    @categories = Category.all
  end

  def show

  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def set_categories
    @categories = Category.all
  end

end