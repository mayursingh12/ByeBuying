class Admin::HeadersController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_header, only: [:edit, :update, :show, :admin_approve, :destroy]

  def index
    if params[:admin_verified] == 'true'
      @headers = Header.all.where(admin_verified: true).paginate(:page => params[:page], :per_page => 20)
    elsif params[:admin_verified] == 'false'
      @headers = Header.all.where(admin_verified: false).paginate(:page => params[:page], :per_page => 20)
    else
      @headers = Header.all.paginate(:page => params[:page], :per_page => 20)
    end

  end

  def new
    @header = Header.new
  end

  def create
    @header = Header.new(header_params)
    if @header.save
      flash[:success] = "Advertisement successfully saved"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @header.update_attributes(header_params)
      flash[:success] = 'Successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def show

  end

  def pending_headers
    @headers = Header.where(admin_verified: false).paginate(:page => params[:page], :per_page => 20)
  end

  def destroy
    @header.destroy
    redirect_to action: :index
  end

  def admin_approve
    if @header.update_attribute(:admin_verified, params[:admin_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def set_header
    @header = Header.find params[:id]
  end

  def header_params
    params.require(:header).permit(:title,
                                   :position,
                                   :redirect_link,
                                   :description,
                                   :start_at,
                                   :end_at,
                                   :per_hour_cost,
                                   :contact,
                                   :category_id,
                                   :subcategory_id).merge(user_id: current_user.id)
  end

end