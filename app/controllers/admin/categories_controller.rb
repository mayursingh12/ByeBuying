class Admin::CategoriesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
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

  private

  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end

end