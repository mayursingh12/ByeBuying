class Admin::CustomersController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_customer, only: [:edit, :update]

  def index
    @customers = Customer.all.with_deleted
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

  private

  def set_customer
    @customer = Customer.with_deleted.find params[:id]
  end

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end