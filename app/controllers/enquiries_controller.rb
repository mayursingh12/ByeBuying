class EnquiriesController < WelcomeController

  before_action :set_product

  def new
    @enquiry = Enquiry.new
  end



  private

  def set_product
    @product = Product.find params[:product_id]
  end

end