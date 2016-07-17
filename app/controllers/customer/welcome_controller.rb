class Customer::WelcomeController < Customer::BaseController

  before_filter :authenticate_user_admin, only: [:dashboard]

  before_filter :authenticate_no_user_admin, only: [:index]

  def index

  end

  def dashboard
    @advertisements = current_user.advertisements
    @products = current_user.products
  end

  def registration

  end

  def log_in
    if sign_in_customer
      redirect_to action: :dashboard
    else
      flash[:error] = 'Email/Password combination wrong, contact super admin.'
      render action: :index
    end
  end

  def sign_up
      @customer = Customer.new(customer_params)
      if @customer.save
        flash[:success] = 'successfully registered.'
        sign_in(@customer)
        redirect_to action: :dashboard
      else
        flash[:error] = @customer.errors.full_messages.first
        render action: :registration
      end
  end

  private

  def sign_in_customer
    email = params[:email]
    password = params[:password]
    return false unless email.present? or password.present?
    customer = Customer.where(email: email).first
    return false unless customer.present?
    if customer.valid_password?(password)
      flash[:success] = "Signed in as #{customer.email}."
      sign_in(customer)
    end
  end

  def customer_params
    params.require(:customer).permit(:name,
                                     :email,
                                     :password,
                                     :password_confirmation)
  end

end