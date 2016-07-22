class EnquiriesController < WelcomeController

  before_action :set_product

  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to product_path(@product)
    else
      render action: :new
    end
  end



  private

  def set_product
    @product = Product.find params[:product_id]
  end

  def enquiry_params
    params.required(:enquiry).permit(:start_at,
                                     :expected_price,
                                     :end_at).merge(product_id: @product.id,
                                                    is_product: true,
                                                    status: 'Enquiry',
                                                    user_id: current_user.id)
  end

end