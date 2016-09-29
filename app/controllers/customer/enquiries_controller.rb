class Customer::EnquiriesController < Customer::BaseController

  before_filter :authenticate_user_admin

  # before_action :set_header_categories
  before_action :set_categories

  before_action :set_enquiry, only: [:show, :edit, :update, :deal]

  def index
    @enquiries = EnquiriesAlgorithm.new(current_user).result.first
  end

  def show

  end

  def update
    if request.format == 'application/json'
      if @enquiry.update_attributes(enquiry_params)
        render status: :ok
      else
        render status: :unprocessable_entity, json: { errors: @enquiry.errors.full_messages }
      end
    else
      if @enquiry.update_attributes(enquiry_params)
        if @enquiry.is_product
          CustomerMailer.product_quoted(@enquiry).deliver_later
        else
          CustomerMailer.service_quoted(@enquiry).deliver_later
        end

        flash[:success] = 'Quote successfully sent'
        redirect_to customer_dashboard_path
      else
        flash[:error] = 'Something went wrong'
        render action: :show
      end
    end
  end

  def deal
    if params[:deal].present?
      if params[:deal] == 'true'
        if @enquiry.update_attributes(status: 'Confirmed')
          if @enquiry.is_product
            CustomerMailer.product_deal_confirmed(@enquiry).deliver_later
          else
            CustomerMailer.service_deal_confirmed(@enquiry).deliver_later
          end
          flash[:success] = 'Thanks for deal. Contact you soon.'
          redirect_to action: :index
        else
          flash[:error] = 'Something wrong'
          render action: :show
        end
      elsif params[:deal] == 'false'
        if @enquiry.update_attributes(status: 'Cancelled')
          if @enquiry.is_product
            CustomerMailer.product_deal_cancelled(@enquiry).deliver_later
          else
            CustomerMailer.product_deal_cancelled(@enquiry).deliver_later
          end
          flash[:success] = 'Thank you for your response.'
          redirect_to action: :index
        else
          flash[:error] = 'Something wrong'
          render action: :show
        end
      else
        flash[:error] = 'Something wrong'
        render action: :show
      end
    else
      # do nothing
      render action: :index
    end

  end

  #   if @enquiry.update_attribute(:deal, params[:deal])
  #     redirect_to action: :index
  #   else
  #     redirect_to action: :index
  #   end
  # end

  private

  def set_enquiry
    product_ids = current_user.products.map(&:id)
    service_ids = current_user.services.map(&:id)
    user_enquiry_ids = current_user.enquiries.map(&:id)
    product_enquiry_ids = Enquiry.where(product_id: product_ids).map(&:id)
    service_enquiry_ids = Enquiry.where(service_id: service_ids).map(&:id)
    enquiry_ids = product_enquiry_ids + service_enquiry_ids + user_enquiry_ids
    @enquiry = Enquiry.where(id: enquiry_ids).find params[:id]
  end

  def enquiry_params
    params.required(:enquiry).permit(:expected_per_hour_price,
                                     :expected_per_day_price,
                                     :expected_per_week_price,
                                     :expected_per_month_price,
                                     :description).merge(status: 'Quoted')
  end

end