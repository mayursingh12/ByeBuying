class SubcategoriesController < ApplicationController

  layout 'default'

  # before_action :set_header_categories
  before_action :set_categories

  before_action :set_subcategory, only: [:show]

  before_action :set_min_max_price, only: [:show]

  before_action :set_filter, only:  [:show]

  def index
    @subcategories = Subcategory.all
  end

  def show
    # where('price > ? AND price < ?', min, max)


  end

  def get_subcategory
    if params[:gender].present?
      if params[:gender] == 'Male'
        @subcategories = Subcategory.where(is_verified: true, category_id: params[:id], subcategory_type: params[:subcategory_type], male: true)
      else
        @subcategories = Subcategory.where(is_verified: true, category_id: params[:id], subcategory_type: params[:subcategory_type], female: true)
      end
    else
      if params[:subcategory_type].present?
        @subcategories = Subcategory.where(is_verified: true, category_id: params[:id], subcategory_type: params[:subcategory_type].titleize)
      else
        @subcategories = Subcategory.where(is_verified: true, category_id: params[:id])
      end
    end
  end

  private

  # def set_header_categories
  #   @categories = Category.all
  # end

  def set_subcategory
    @subcategory = Subcategory.find params[:id]
  end

  def set_min_max_price

    @min_price = 0.0
    @max_price = 0.0

    price_list = []

    price_list = @subcategory.products.map(&:per_hour_price) +
        @subcategory.products.map(&:per_day_price) +
        @subcategory.products.map(&:per_week_price) +
        @subcategory.products.map(&:per_month_price) +
        @subcategory.services.map(&:per_hour_price) +
        @subcategory.services.map(&:per_day_price) +
        @subcategory.services.map(&:per_week_price) +
        @subcategory.services.map(&:per_month_price)

    @min_price = price_list.min
    @max_price = price_list.max

    # product_min_price = Product.minimum(:price_in_rupees)
    # product_max_price = Product.maximum(:price_in_rupees)
    #
    # service_min_price = Service.minimum(:price_in_rupees)
    # service_max_price = Service.maximum(:price_in_rupees)
    #
    # @min_price = [product_min_price, service_min_price].min.to_i
    # @max_price = [product_max_price, service_max_price].max.to_i

  end

  def set_filter

    if  params[:min_price].present? and params[:max_price].present? and params[:quantity].present? and params[:rating].present? and params[:category_id].present? and params[:subcategory_id].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND category_id = ? AND subcategory_id = ? ', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity], params[:rating], params[:rating], params[:category_id], params[:subcategory_id]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND category_id = ? AND subcategory_id = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:rating], params[:rating], params[:category_id], params[:subcategory_id]).order('id DESC')
    elsif params[:min_price].present? and params[:max_price].present? and params[:quantity].present? and params[:rating].present? and params[:category_id].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND category_id = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity], params[:rating], params[:rating], params[:category_id]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND category_id = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:rating], params[:rating], params[:category_id]).order('id DESC')
    elsif params[:min_price].present? and params[:max_price].present? and params[:quantity].present? and params[:rating].present? and params[:subcategory_id].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND subcategory_id = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity], params[:rating], params[:rating], params[:subcategory_id]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND subcategory_id = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:rating], params[:rating], params[:subcategory_id]).order('id DESC')
    elsif params[:min_price].present? and params[:max_price].present? and params[:quantity].present? and params[:rating].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity], params[:rating], params[:rating]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:rating], params[:rating]).order('id DESC')
    elsif params[:min_price].present? and params[:max_price].present? and params[:quantity].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
    elsif params[:min_price].present? && params[:max_price].present?
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ? )', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ? )', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
    else
      @products = @subcategory.products.where(admin_verified: true).where('end_at > ?', DateTime.now).order('id DESC')
      @services = @subcategory.services.where(admin_verified: true).where('end_at > ?', DateTime.now).order('id DESC')
    end
  end


end