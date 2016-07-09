class Admin::AdvertisementsController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_advertisement, only: [:edit, :update, :show, :admin_approve, :destroy]

  def index
    @advertisements = Advertisement.all.paginate(:page => params[:page], :per_page => 20)
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
     flash[:success] = 'Successfully updated'
     redirect_to action: :index
   else
     render action: :edit
   end
  end

  def show
    
  end

  def destroy
    @advertisement.destroy
    redirect_to action: :index
  end

  def admin_approve
    if @advertisement.update_attribute(:admin_verified, params[:admin_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
    end
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
                                          :contact,
                                          :email,
                                          :contact,
                                          :category_id,
                                          :subcategory_id)
  end

end