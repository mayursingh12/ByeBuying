class RatingsController < ApplicationController

  layout 'default'

  before_action :set_categories

  def new
    @product_type =  params[:product_type]
    @rating = Rating.new(
        rateable_id: params[:product_id],
        rateable_type: params[:product_type],
        user_id: params[:user_id]
    )
  end

  def create
    is_product = params[:rating][:is_product] == "Product" ? true : false
    @rating = Rating.new(rating_params)
    @rating.is_product = is_product
    if @rating.save
      redirect_to root_path
    else
      params[:product_id] = params[:rating][:product_id]
      params[:product_id] = params[:rating][:product_id]
      params[:user_id] = params[:rating][:user_id]
      render action: :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(
                               :number,
                               :rateable_id,
                               :rateable_type,
                               :user_id,
                               :feedback,
                               :recommand,
                               :is_product
    )
  end

end