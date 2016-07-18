class Admin::CustomersController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def edit

  end

  def update
    if @customer.update_without_password(customer_params)
      flash[:success] = 'Successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    if @customer.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def set_customer
    @customer = Customer.find params[:id]
  end

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end