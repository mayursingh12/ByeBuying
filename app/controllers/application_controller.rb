class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  private

  def api_user
    @api_user ||= User.where(api_token: params[:api_token]).last
  end

  def current_user
    params[:api_token].present? ? api_user : super
  end

  def set_categories
    @categories = Category.all.includes(:subcategories)
  end
end
