class Admin::SubcategoriesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_subcategory, only: [:edit, :update, :admin_approve]

  def index
    @subcategories = Subcategory.paginate(:page => params[:page], :per_page => 20).all.order(:name)
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:success] = 'Subcategory Successfully Created.'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @subcategory.update_attributes(subcategory_params)
      flash[:success] = 'Successfully Update.'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def get_subcategories_for_category
      @subcategories = Subcategory.where(category_id: params[:id])
  end

  def admin_approve
    if @subcategory.update_attribute(:is_verified, params[:is_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def set_subcategory
    @subcategory = Subcategory.find params[:id]
  end

  def subcategory_params
    params.require(:subcategory).permit(:name,
                                        :category_id,
                                        :interior_image,
                                        :male,
                                        :female,
                                        :subcategory_type)
  end

end