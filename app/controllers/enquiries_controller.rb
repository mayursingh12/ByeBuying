class EnquiriesController < WelcomeController

  before_action :set_variable

  def new
    @enquiry = Enquiry.new
  end

  def create
    if request.format == 'application/json'
      if @product.present?
        @enquiry = Enquiry.new(enquiry_params)
        if @enquiry.save
          render status: :ok
        else
          render status: :unprocessable_entity, json: {errors: @enquiry.errors.full_messages}
        end
      else
        @enquiry = Enquiry.new(service_enquiry_params)
        if @enquiry.save
          render status: :ok
        else
          render status: :unprocessable_entity, json: {errors: @enquiry.errors.full_messages}
        end
      end
    else
      if @product.present?
        @enquiry = Enquiry.new(enquiry_params)
        if @enquiry.save
          flash[:success] = 'Enquired successfully'
          redirect_to product_path(@product)
        else
          flash[:success] = 'Something went wrong'
          render action: :new
        end
      else
        @enquiry = Enquiry.new(service_enquiry_params)
        if @enquiry.save
          flash[:success] = 'Enquired successfully'
          redirect_to service_path(@service)
        else
          flash[:success] = 'Something went wrong'
          render action: :new
        end
      end
    end
  end

  private

  def set_variable
    if params[:product_id].present?
      @product = Product.where(admin_verified: true).find params[:product_id]
    else
      @service = Service.where(admin_verified: true).find params[:service_id]
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