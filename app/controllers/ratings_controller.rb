class RatingsController < ApplicationController

  layout 'default'

  before_action :set_categories

  def new
    @rating = Rating.new(
        rateable_id: params[:product_id],
        rateable_type: params[:product_id],
        user_id: params[:user_id]
    )
  end

  def create
    @rating = Rating.new(rating_params)
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
                               :feedback
    )
  end

end