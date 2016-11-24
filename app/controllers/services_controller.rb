class ServicesController < ApplicationController

  layout 'default'

  before_action :set_categories
  # before_action :set_header_categories

  before_action :set_service, only: [:show]

  def index
    if request.format == 'application/json'
      @services = Service.where(admin_verified: true).all
    else
      @services = Service.where(admin_verified: true).all.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
    
  end

  private

  # def set_header_categories
  #   @categories = Category.all
  # end

  def set_service
    @service = Service.find params[:id]
    if (!@service.recommand_count)
      @service.recommand_count = 0;
    end
    if (!@service.customer_review)
      @service.customer_review = 0;
    end
    @ratings = @service.ratings
  end

end