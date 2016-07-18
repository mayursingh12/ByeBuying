class Admin::CitiesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_city, only: [:edit, :update]

  def index
    @cities = City.all.order(:name).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:success] = 'City Succssfully Created'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @city.update_attributes(city_params)
      flash[:success] = 'Successfully Updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def set_city
    @city = City.find params[:id]
  end

  def city_params
      params.require(:city).permit(:name, :state_id)
  end

end