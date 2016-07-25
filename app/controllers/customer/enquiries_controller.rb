class Customer::EnquiriesController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_header_categories

  def index
    @enquiries = EnquiriesAlgorithm.new(current_user).result.first
  end


end