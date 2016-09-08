class Customer::BaseController < ApplicationController

  layout 'customer'

  def authenticate_user_admin
    if current_user.present? and current_user.customer?
      #proceed
    else
      redirect_to customer_path
    end
  end

  def authenticate_no_user_admin
    if current_user.present? and current_user.customer?
      #proceed
      redirect_to root_path
    end
  end

  # def set_header_categories
  #   @categories = Category.all
  # end

  def set_categories
    @categories = Category.all.includes(:subcategories)
  end

  def authenticate_user_api
    unless current_user.present?
      render status: :unprocessable_entity, json: {errors: ['Not signed in']}
    end
  end

  private

  def api_user
    @api_user ||= Customer.where(api_token: params[:api_token]).last
  end

  def current_user
    params[:api_token].present? ? api_user : super
  end

end