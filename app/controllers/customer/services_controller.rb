class Customer::ServicesController < Customer::BaseController

  before_action :set_service, only: [:edit, :update, :show, :destroy]

  before_action :set_header_categories

  def index
    @services = current_user.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if request.format == 'application/json'
      if @service.save
        render status: :ok, json: {success: 'successfully saved.'}
      else
        render status: :unprocessable_entity, json: { errors: @service.errors.full_messages }
      end
    else
      if @service.save
        flash[:success] = 'Service successfully created'
        redirect_to action: :index
      else
        render action: :new
      end
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

  def destroy
    @service.destroy
    redirect_to action: :index
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
                                    # :price_type,
                                    # :price_in_rupees,
                                    :per_hour_price,
                                    :per_day_price,
                                    :per_week_price,
                                    :per_month_price,
                                    :negotiable,
                                    :youtube_link,
                                    :other).merge(user_id: current_user.id)
  end

end