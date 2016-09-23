class Admin::ServicesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_service, only: [:show, :update_rating, :admin_approve, :destroy]

  def index
    @services = Service.all
  end

  def show

  end

  def update_rating
    if @service.update_attributes(rating: params[:rating])
      flash[:success] = 'Rating successfully updated.'
      redirect_to action: :show

    else
      render action: :show
    end
  end

  def admin_approve
    if @service.update_attribute(:admin_verified, params[:admin_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  def destroy
    # @service.destroy
    # redirect_to action: :index
  end

  private

  def set_service
    @service = Service.find params[:id]
  end

end