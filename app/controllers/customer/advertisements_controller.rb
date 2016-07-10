class Customer::AdvertisementsController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_advertisement, only: [:edit, :update, :show]

  def index
    @advertisements = current_user.advertisements
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

  def update
    if @advertisement.update_attributes(advertisement_params)
      flash[:success] = 'Successfully Updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def show

  end

  private

  def set_advertisement
    @advertisement = Advertisement.find params[:id]
  end

  def advertisement_params
    params.require(:advertisement).permit(:title,
                                           :description,
                                           :start_at,
                                           :end_at,
                                           :per_hour_cost,
                                           :category_id,
                                           :subcategory_id).merge(user_id: current_user.id)
  end

end