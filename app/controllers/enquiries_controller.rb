class EnquiriesController < ApplicationController

  layout 'default'

  before_action :set_categories

  before_action :set_variable

  def new
    @enquiry = Enquiry.new
  end

  def create
    if request.format == 'application/json'
      if @product.present?
        @enquiry = Enquiry.new(enquiry_params)
        if @enquiry.save
          render status: :ok, json: {success: 'Successfully enquired.'}
        else
          render status: :unprocessable_entity, json: {errors: @enquiry.errors.full_messages}
        end
      else
        @enquiry = Enquiry.new(service_enquiry_params)
        if @enquiry.save
          render status: :ok, json: {success: 'Successfully enquired.'}
        else
          render status: :unprocessable_entity, json: {errors: @enquiry.errors.full_messages}
        end
      end
    else
      if @product.present?
        valid = validate_enquiry_params(enquiry_params)
        if valid
          @enquiry = Enquiry.new(enquiry_params)
          if @enquiry.save
            @enquiry.product.update_attributes(is_enquired: true)
            flash[:success] = 'Enquired successfully'
            CustomerMailer.product_enquiry(@enquiry).deliver_later
            phone = '+91'+@enquiry.product.user.contact

            if phone.present?

                     HTTP.get('http://bhashsms.com/api/sendmsg.php', params: {user: 'ravikataria', pass: '123', sender: 'BYEBUY', phone: phone, text: "Your have recieved an enquiry for your product. Please login to www.byebuying.com for more information", priority: 'ndnd', style: 'normal'})
                      # do nothing
                      # render status: :ok, json: {}

              else
                # render status: :unprocessable_entity, json: { }
              end

            redirect_to product_path(@product)

          else
            flash[:success] = 'Something went wrong'
            render action: :new
          end
        else
          flash[:error] = "You can only enquire #{available_quantity} for this product."
        end
      else
        @enquiry = Enquiry.new(service_enquiry_params)
        if @enquiry.save
          @enquiry.service.update_attributes(is_enquired: true)
          flash[:success] = 'Enquired successfully'
          CustomerMailer.service_enquiry(@enquiry).deliver_later
          phone = '+91'+@enquiry.service.user.contact
          HTTP.get('http://bhashsms.com/api/sendmsg.php', params: {user: 'ravikataria', pass: '123', sender: 'BYEBUY', phone: phone, text: "Your have recieved an enquiry for your service. Please login to www.byebuying.com for more information", priority: 'ndnd', style: 'normal'})
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
                                     :expected_per_hour_price,
                                     :expected_per_day_price,
                                     :expected_per_week_price,
                                     :expected_per_month_price,
                                     :quantity,
                                     :end_at).merge(product_id: @product.id,
                                                    is_product: true,
                                                    status: 'Enquiry',
                                                    user_id: current_user.id)
  end

  def service_enquiry_params
    params.required(:enquiry).permit(:start_at,
                                     :expected_per_hour_price,
                                     :expected_per_day_price,
                                     :expected_per_week_price,
                                     :expected_per_month_price,
                                     :quantity,
                                     :end_at).merge(service_id: @service.id,
                                                    is_product: false,
                                                    status: 'Enquiry',
                                                    user_id: current_user.id)
  end

  def validate_enquiry_params(enquiry_params)
    @product = Product.find(enquiry_params[:product_id])
    enquiries = Enquiry.where(status: STATUS_CONFIRMED, product_id: @product.id)
    confirmed_quantity = enquiries.sum(:quantity)
    enquiries.each do |enquiry|
      if enquiry_params[:start_at].between?(enquiry.start_at, enquiry.end_at)) ||
         enquiry_params[:end_at].between?(enquiry.start_at, enquiry.end_at))
         available_quantity = @product.quantity - enquiry.quantity
         if available_quantity < enquiry_params[:quantity]
           return false
         else
           return true
         end
       end
     end
  end

end
