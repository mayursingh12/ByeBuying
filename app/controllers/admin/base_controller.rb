class Admin::BaseController < ApplicationController

  def authenticate_admin
    if current_user.present? and current_user.admin?
      #proceed
    else
      redirect_to admin_path
    end
  end

  def authenticate_no_admin
    if current_user.present? and current_user.admin?
      #proceed
      redirect_to admin_dashboard_path
    end
  end

end