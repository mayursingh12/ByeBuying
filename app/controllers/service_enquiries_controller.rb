# class ServiceEnquiriesController < WelcomeController
#
#   before_action :set_service
#
#   def new
#     @enquiry = Enquiry.new
#   end
#
#   def create
#     @enquiry = Enquiry.new(enquiry_params)
#     if @enquiry.save
#       redirect_to service_path(@service)
#     else
#       render action: :new
#     end
#   end
#
#   private
#
#   def set_service
#     @service = Service.find params[:service_id]
#   end
#
#   def enquiry_params
#     params.required(:service_enquiry).permit(:start_at,
#                                      :expected_price,
#                                      :end_at).merge(service_id: @service.id,
#                                                     is_product: false,
#                                                     status: 'Enquiry',
#                                                     user_id: current_user.id)
#   end
#
#
# end