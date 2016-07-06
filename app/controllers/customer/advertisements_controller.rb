class Customer::AdvertisementsController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_advertisement, only: [:edit, :update, :show]

  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    if @advertisement.save
      flash[:success] = "Advertisement successfully saved"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def show

  end

  def update
    if @advertisement.update_attribute(advertisement_params)
      flash[:success] = 'Successfully Updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def set_advertisement
    @advertisement = Advertisement.find params[:id]
  end

  def advertisement_params
    params.require(:advertisement).permit(:title,
                                           :description,
                                           :start_at,
                                           :end_at,
                                           :per_hour_cost,
                                           :contact,
                                           :email,
                                           :contact,
                                           :category_id,
                                           :subcategory_id)
  end

end