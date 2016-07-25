class ServicesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  before_action :set_service, only: [:show]

  def index
    @services = Service.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    
  end

  private

  def set_header_categories
    @categories = Category.all
  end

  def set_service
    @service = Service.find params[:id]
  end

end