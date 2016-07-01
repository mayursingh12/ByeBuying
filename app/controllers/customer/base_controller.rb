class Customer::BaseController < ApplicationController

  layout 'customer'

  def authenticate_user_admin
    if current_user.present? and current_user.customer?
      #proceed
    else
      redirect_to admin_path
    end
  end

  def authenticate_no_user_admin
    if current_user.present? and current_user.customer?
      #proceed
      redirect_to admin_dashboard_path
    end
  end

end