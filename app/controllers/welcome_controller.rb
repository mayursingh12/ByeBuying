class WelcomeController < ApplicationController

  layout 'default'

  before_action :set_categories

  before_action :set_min_max_price, only: [:index]

  before_action :set_filter, only:  [:index]

  def index
    # if params[:title].present? and params[:category].present?
    #   @advertisements = AdvertisementFilterAlgo.new.filter_by_all(params[:title], params[:category])
    # elsif params[:title].present?
    #   @advertisements = AdvertisementFilterAlgo.new.filter_by_title(params[:title])
    # elsif params[:category].present?
    #   @advertisements = AdvertisementFilterAlgo.new.filter_by_category(params[:category])
    # else
    #   @advertisements = Advertisement.all.where(admin_verified: true)
    # end

    @advertisements = Advertisement.where(admin_verified: true).includes(:advertisement_images).last(5)
  end

  def categories
    # @advertisements = Advertisement.where(admin_verified: true).last(15)
    @categories = Category.all
  end

  # def subcategories
  #
  # end

  def contact_us

  end

  def about_us

  end

  def listing_policy

  end

  def terms_condition

  end

  def privacy_policy

  end

  def faq

  end

  def test
    redirect_to root_path
  end

  def forgot_password
   if params[:phone].present?
     @phone = params[:phone]

     @user_ = User.where(contact: @phone).first

     if @user_.present?
       @token = SecureRandom.urlsafe_base64(8)
       @user_.update_attributes(password: @token)
       SmsDelivery.new(@phone, SmsTemplates.change_password(@token.to_s)).delay.deliver
       # SmsDelivery.new(@phone, SmsTemplates.change_password(@token.to_s)).deliver
       CustomerMailer.forgot_password(@user_, @token).deliver_later
       flash[:success] = 'Your updated password has been sent successfully.'
       render status: :ok, nothing: true
     end
   else
     render status: :unprocessable_entity, json: { errors: ['User Not Registered'] }
   end

  end

  private

  # def set_categories
  #   @categories = Category.all
  # end

  def set_min_max_price

    @min_price = 0.0
    @max_price = 0.0
    @negotiable = false

    price_list = []

    products = Product.all.where(admin_verified: true)
    services = Service.all.where(admin_verified: true)

    price_list = products.map(&:per_hour_price) +
        products.map(&:per_day_price) +
        products.map(&:per_week_price) +
        products.map(&:per_month_price) +
        services.map(&:per_hour_price) +
        services.map(&:per_day_price) +
        services.map(&:per_week_price) +
        services.map(&:per_month_price)

    @min_price = price_list.min
    @max_price = price_list.max
  end

  def set_filter
    if params[:min_price].present? and params[:max_price].present? and params[:quantity].present? and params[:rating].present?
      @products = Product.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity], params[:rating], params[:rating]).includes(:product_images).order('id DESC')
      @services = Service.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:rating], params[:rating]).includes(:service_images).order('id DESC')
      # @advertisements = Advertisement.where(admin_verified: true).where('per_hour_cost > ? AND per_hour_cost < ? OR per_hour_cost = ? OR per_hour_cost = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
    elsif params[:min_price].present? and params[:max_price].present? and params[:quantity].present?
      @products = Product.where(admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:quantity]).includes(:product_images).order('id DESC')
      @services = Service.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).includes(:service_images).order('id DESC')
      # @advertisements = Advertisement.where(admin_verified: true).where('per_hour_cost > ? AND per_hour_cost < ? OR per_hour_cost = ? OR per_hour_cost = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
    elsif params[:min_price].present? && params[:max_price].present?
      @products = Product.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ? )', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC').includes(:product_images)
      @services = Service.where(admin_verified: true).where('end_at > ?', DateTime.now).where('(per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ? )', params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price], params[:min_price], params[:max_price]).includes(:service_images).order('id DESC')
      # @advertisements = Advertisement.where(admin_verified: true).where('per_hour_cost > ? AND per_hour_cost < ? OR per_hour_cost = ? OR per_hour_cost = ?', params[:min_price], params[:max_price], params[:min_price], params[:max_price]).order('id DESC')
    else
      @products = Product.where(admin_verified: true).where('end_at > ?', DateTime.now).limit(10).order('id DESC').includes(:product_images)
      # @advertisements = Advertisement.where(admin_verified: true).order('id DESC')
      @services = Service.where(admin_verified: true).limit(10).order('id DESC').includes(:service_images)
    end
  end


end