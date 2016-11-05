class EnquiriesAlgorithm

  def initialize(current_user)
    @customer = current_user
    @enquries = Enquiry.all
    @results = []
  end

  def result

    product_ids = @customer.products.map(&:id)
    service_ids = @customer.services.map(&:id)

    @results << {
        product_enquiries: @enquries.where(product_id: product_ids),
        service_enquiries: @enquries.where(service_id: service_ids),
        #customer_enquiries: @enquries.where(user_id: @customer.id)
        customer_enquiries: @enquries.where("user_id = ? AND status != ?", @customer.id, 'Cancelled')
    }
    
    @results
  end

end