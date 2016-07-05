class Customer::AdvertisementsController < Customer::BaseController

  before_filter :authenticate_customer

  before_action :set_advertisement, only: [:edit, :update, :show]

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

end