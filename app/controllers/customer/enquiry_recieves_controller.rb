class Customer::EnquiryRecievesController < Customer::BaseController

  # before_action :set_header_categories
  before_action :set_categories

  def index
    @products = current_user.products
    @services = current_user.services

    @enquiries = EnquiriesAlgorithm.new(current_user).result.first
  end

  def show

  end

  private

end