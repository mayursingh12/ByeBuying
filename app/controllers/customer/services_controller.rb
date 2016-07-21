class Customer::ServicesController < Customer::BaseController

  before_action :set_service, only: [:edit, :update, :show]

  def index
    @services = current_user.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = 'Service successfully created'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @service.update_attributes(service_params)
      flash[:success] = 'successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def show

  end

  private

  def set_service
    @service = current_user.services.find params[:id]
  end

  def service_params
    params.require(:service).permit(:name,
                                    :category_id,
                                    :subcategory_id,
                                    :nature_of_service,
                                    :club_name,
                                    :membership_plan,
                                    :start_at,
                                    :end_at,
                                    :area_in_meters,
                                    :amenities_available,
                                    :service_description,
                                    :state_id,
                                    :city_id,
                                    :location,
                                    :price_type,
                                    :price_in_rupees,
                                    :youtube_link,
                                    :other).merge(user_id: current_user.id)
  end

end