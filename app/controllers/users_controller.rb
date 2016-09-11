class UsersController < ApplicationController

  layout 'default'

  before_action :set_categories

  before_action :set_user

  def all
    @products = @user.products
    @services = @user.services
  end

  private

  def set_user
    @user = User.find params[:id]
  end

end