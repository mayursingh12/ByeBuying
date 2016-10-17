class SearchesController < ApplicationController

  layout 'default'

  # before_action :set_header_categories

  before_action :set_categories
  before_action :set_min_max_price, only: [:show]

  def create
    @search = Search.create(search_params)

    if request.format == 'application/json'
      if @search.name.present?
        render status: :ok, json: { id:  @search.id }
      else
        render status: :unprocessable_entity, json: { errors: "Can't blank" }
      end
    else
      if @search.name.present?
        redirect_to action: :show, id: @search.id
      else
        flash[:error] = "Search Can't be blank"
        # redirect_to controller: "#{@search.controller_name}", action: "#{@search.action_name}"
        redirect_to root_path
      end
    end

    # if @search.name.present?
    #   redirect_to action: :show, id: @search.id
    # else
    #   flash[:error] = "Search Can't be blank"
    #   # redirect_to controller: "#{@search.controller_name}", action: "#{@search.action_name}"
    #   redirect_to root_path
    # end
  end

  def show
    min_price = params[:min_price]
    max_price = params[:max_price]
    rating = params[:rating]
    quantity = params[:quantity]
    category_id = params[:category_id]
    subcategory_id = params[:subcategory_id]
    state_id = params[:state_id]
    city_id = params[:city_id]

    min_price = 0 unless params[:min_price].present?
    max_price = @max_price unless params[:max_price].present?
    rating = 0 unless params[:rating].present?
    quantity = 0 unless params[:quantity].present?

    max_price = @max_price unless params[:max_price].present?

    @results = SearchAlgorithm.new(params[:id], max_price, min_price, rating, quantity, category_id, subcategory_id, city_id, state_id).results.first
  end

  private

  def search_params
    params.required(:search).permit(:name)
  end

  # def set_header_categories
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

end