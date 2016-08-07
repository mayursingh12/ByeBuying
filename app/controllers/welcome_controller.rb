class WelcomeController < ApplicationController

  layout 'default'

  before_action :set_categories

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
    @products = Product.where(admin_verified: true).last(15)
    @advertisements = Advertisement.where(admin_verified: true).last(15)
    @services = Service.where(admin_verified: true).last(15)

  end

  def categories
    @advertisements = Advertisement.where(admin_verified: true).last(15)
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

  def test
    redirect_to root_path
  end

  private

  def set_categories
    @categories = Category.all
  end

end