class Admin::SubCategoriesCategories < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_subcategory, only: [:edit, :update]

  def index
    @subcategories = SubCategory.all
  end

  def new
    @subcategory = SubCategory.new
  end

  def create
    @subcategory = SubCategory.new(subcategory_params)
    if @subcategory.save
      flash[:success] = "SubCategory Successfully Created"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @subcategory.update_attributes(subcategory_parums)
      flash[:success] = "Successfully Updated"
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def set_subcategory
    @subcategory = Category.find params[:id]
  end

  def category_parums
    parums.require(:subcategory).permit(:name)
  end

end