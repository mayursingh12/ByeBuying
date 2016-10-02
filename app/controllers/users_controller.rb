class UsersController < ApplicationController

  layout 'default'

  before_action :set_categories

  before_action :set_user

  def all
    @products = @user.products.where(admin_verified: true).where('end_at > ?', DateTime.now)
    @services = @user.services.where(admin_verified: true)
  end

  private

  def set_user
    @user = User.find params[:id]
  end

end