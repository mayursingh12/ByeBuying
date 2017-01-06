class Customer::HeadersController < Customer::BaseController

  before_filter :authenticate_user_admin

  before_action :set_header, only: [:edit, :update, :show, :destroy]

  # before_action :set_header_categories
  before_action :set_categories

  def index
    @headers = current_user.headers.includes(:header_images, :subcategory)
  end

  def new
    @header = Header.new
  end

  def create
    @header = Header.new(header_params)
    if @header.save
      flash[:success] = "Header successfully saved"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @header.update_attributes(header_params)
      flash[:success] = 'Successfully Updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def show

  end

  def destroy
    @header.destroy
    redirect_to action: :index
  end

  private

  def set_header
    @header = current_user.headers.find params[:id]
  end

  def header_params
    params.require(:header).permit(:title,
                                           :description,
                                           :start_at,
                                           :end_at,
                                           :per_hour_cost,
                                           :category_id,
                                           :subcategory_id).merge(user_id: current_user.id, admin_verified: false)
  end

end