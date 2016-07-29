class Customer::WelcomeController < Customer::BaseController

  before_filter :authenticate_user_admin, only: [:dashboard, :profile, :update_profile_image, :change_password_, :change_mobile]

  before_filter :authenticate_no_user_admin, only: [:index]

  before_action :set_customer, only: [:profile, :update_profile_image, :change_password_, :change_mobile]

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
    if params[:phone].present?
      @otp = rand(1000..9999).to_s
      @phone = params[:phone]
      user_ = User.where(contact: @phone).first
      if user_.present?
        # already registered
        flash[:error] = 'Already registered'
        redirect_to action: :mobile_number
      else
        new_user =  NewUser.where(phone: @phone).first
        if new_user.present?
          if new_user.update_attributes(otp: @otp)
            # do nothing
          else
            flash[:error] = 'Something went wrong, try again later.'
            redirect_to action: :mobile_number
          end
        else
          NewUser.create(phone: @phone, otp: @otp)
        end
      end
    else
      flash[:error] = "Mobile number can't blank"
      render action: :mobile_number
    end
  end

  def after_otp
    @phone = params[:phone]
    new_user = NewUser.where(phone: @phone).last
    if new_user.present?
      if new_user.otp == params[:otp]
        # do nothing
        redirect_to action: :registration, contact: @phone
      else
        flash[:error] = 'OTP not matched'
        render action: :otp, phone: @phone
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

  def profile

  end

  def update_profile_image
    if @customer.update_attributes(image: params[:image])
      redirect_to customer_profile_path
    else
      flash[:error] = "#{@customer.errors.full_messages.first}"
      render action: :profile
    end
  end

  def change_password_
    if @customer.update_attributes(password: params[:password])
      flash[:success] = 'Successfully updated'
      redirect_to customer_profile_path
    else
      flash[:error] = "#{@customer.errors.full_messages.first}"
      render action: :profile
    end
  end

  def change_mobile
    if @customer.update_attributes(contact: params[:contact])
      flash[:success] = 'Successfully updated'
      redirect_to customer_profile_path
    else
      flash[:error] = "#{@customer.errors.full_messages.first}"
      render action: :profile
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

  def set_customer
    @customer = current_user
  end

  def customer_image_params
    params.require(:customer).permit(:image)
  end


end