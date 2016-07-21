class WelcomeController < ApplicationController

  layout 'default'

  before_action :set_categories

  def index
    if params[:title].present? and params[:category].present?
      @advertisements = AdvertisementFilterAlgo.new.filter_by_all(params[:title], params[:category])
    elsif params[:title].present?
      @advertisements = AdvertisementFilterAlgo.new.filter_by_title(params[:title])
    elsif params[:category].present?
      @advertisements = AdvertisementFilterAlgo.new.filter_by_category(params[:category])
    else
      @advertisements = Advertisement.all.where(admin_verified: true)
    end

  end

  def categories
    @advertisements = Advertisement.all
    @categories = Category.all
  end

  def test
    redirect_to root_path
  end

  private

  def set_categories
    @categories = Category.all
  end

end