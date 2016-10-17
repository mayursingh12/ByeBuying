class Admin::CategoriesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_category, only: [:edit, :update, :admin_approve]

  def index
    @categories = Category.all.order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category successfully created.'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = 'Successfully updated.'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def admin_approve
    if @category.update_attribute(:is_verified, params[:is_verified])
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name,
                                     :icon_image,
                                     :interior_image,
                                     :detail_image)
  end

end