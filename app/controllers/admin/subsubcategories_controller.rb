class Admin::SubsubcategoriesController < Admin::BaseController

  before_filter :authenticate_admin

  def index
    @subsubcategories = Subsubcategory.all.order(:name, :subcategory_id)
  end

  def new
    @subsubcategory = Subsubcategory.new
  end

  def create
    @subsubcategory = Subsubcategory.new(subsubcategory_params)
    if @subsubcategory.save
      flash[:success] = 'Subsubcategory Successfully Created'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @subsubcategory.update_attributes(subsubcategory_params)
      flash[:success] = 'Successfully Update.'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def set_subsubcategory
    @subsubcategory = Subsubcategory.find.params[:id]
  end

  def subsubcategory_params
    params.require(:subsubcategory).permit(:name, :subcategory_id)
  end

end