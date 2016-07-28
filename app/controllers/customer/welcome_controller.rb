class Customer::WelcomeController < Customer::BaseController

  before_filter :authenticate_user_admin, only: [:dashboard]

  before_filter :authenticate_no_user_admin, only: [:index]

  before_action :set_header_categories

  def index

  end

  def dashboard
    @advertisements = current_user.advertisements
    @products = current_user.products
  end

  def registration

  end

  def mobile_number
    @new_user = NewUser.new
  end

  def otp
    @otp = rand(1000..9999).to_s
    @phone = params[:phone]
    user_ = User.where(contact: params[:phone]).first
    if user_.present?
      # already registered
      flash[:error] = 'Already registered'
      redirect_to action: :mobile_number
    else
     new_user =  NewUser.where(phone: params[:phone]).first
      if new_user.present?
        if new_user.update_attributes(otp: @otp)
            # do nothing
          else
            flash[:error] = 'Something went wrong, try again later.'
            redirect_to action: :mobile_number
        end
      else
        NewUser.create(phone: params[:phone], otp: @otp)
      end

    end

  end

  def after_otp
    new_user = NewUser.where(phone: params[:phone]).last
    if new_user.present?
      if new_user.otp == params[:otp]
        # do nothing
        redirect_to action: :registration, contact: params[:phone]
      else
        flash[:error] = 'OTP not matched'
        render action: :otp
      end
    else
      flash[:error] = 'Something went wrong, try again later.'
      redirect_to root_path
    end
  end

  def log_in
    if sign_in_customer
      redirect_to action: :index
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
                                     :contact,
                                     :password_confirmation)
  end


end