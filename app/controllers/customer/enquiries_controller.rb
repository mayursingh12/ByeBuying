class Customer::EnquiriesController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_header_categories

  before_action :set_enquiry, only: [:show, :edit, :update, :deal]

  def index
    @enquiries = EnquiriesAlgorithm.new(current_user).result.first
  end

  def show

  end

  def update
    if @enquiry.update_attributes(enquiry_params)
      flash[:success] = 'Quote successfully sent'
      redirect_to customer_enquiries_path
    else
      flash[:error] = 'Something went wrong'
      render action: :show
    end
  end

  def deal
    if params[:deal].present?
      if params[:deal] == 'true'
        if @enquiry.update_attributes(status: 'Confirmed')
          flash[:success] = 'Thanks for deal. Contact you soon.'
          redirect_to action: :index
        else
          flash[:error] = 'Something wrong'
          render action: :show
        end
      elsif params[:deal] == 'false'
        if @enquiry.update_attributes(status: 'Cancelled')
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
    params.required(:enquiry).permit(:expected_price, :description).merge(status: 'Quoted')
  end

end