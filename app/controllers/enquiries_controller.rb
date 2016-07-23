class EnquiriesController < WelcomeController

  before_action :set_variable

  def new
    @enquiry = Enquiry.new
  end

  def create
    if @product.present?
      @enquiry = Enquiry.new(enquiry_params)
      if @enquiry.save
        redirect_to product_path(@product)
      else
        render action: :new
      end
    else
      @enquiry = Enquiry.new(service_enquiry_params)
      if @enquiry.save
        redirect_to service_path(@service)
      else
        render action: :new
      end
    end


  end

  private

  def set_variable
    if params[:product_id].present?
      @product = Product.find params[:product_id]
    else
      @service = Service.find params[:service_id]
    end
  end

  def enquiry_params
    params.required(:enquiry).permit(:start_at,
                                     :expected_price,
                                     :end_at).merge(product_id: @product.id,
                                                    is_product: true,
                                                    status: 'Enquiry',
                                                    user_id: current_user.id)
  end

  def service_enquiry_params
    params.required(:enquiry).permit(:start_at,
                                     :expected_price,
                                     :end_at).merge(service_id: @service.id,
                                                    is_product: false,
                                                    status: 'Enquiry',
                                                    user_id: current_user.id)
  end

end