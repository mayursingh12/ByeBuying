class ServicesController < ApplicationController

  layout 'default'

  before_action :set_categories
  # before_action :set_header_categories

  before_action :set_service, only: [:show]

  def index
    if request.format == 'application/json'
      @services = Service.where(admin_verified: true)
    else
      @services = Service.where(admin_verified: true).paginate(:page => params[:page], :per_page => 20)
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
    @ratings = @service.ratings
  end

end