class Customer::EnquiriesController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_header_categories

  before_action :set_enquiry, only: [:show]

  def index
    @enquiries = EnquiriesAlgorithm.new(current_user).result.first
  end

  def show

  end

  private

  def set_enquiry
    product_ids = current_user.products.map(&:id)
    service_ids = current_user.services.map(&:id)
    product_enquiry_ids = Enquiry.where(product_id: product_ids).map(&:id)
    service_enquiry_ids = Enquiry.where(service_id: service_ids).map(&:id)
    enquiry_ids = product_enquiry_ids + service_enquiry_ids
    @enquiry = Enquiry.where(id: enquiry_ids).find params[:id]
  end


end