class Admin::EnquiriesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_enquiry, only: [:show]

  def index
    @enquiries = Enquiry.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show

  end

  private

  def set_enquiry
    @enquiry = Enquiry.find params[:id]
  end

end