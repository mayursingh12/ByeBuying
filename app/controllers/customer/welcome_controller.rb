class Customer::WelcomeController < Customer::BaseController

  before_filter :authenticate_user_admin, only: [:dashboard, :profile, :update_profile_image, :change_password_, :change_mobile, :sign_out_, :wish_list]

  before_filter :authenticate_no_user_admin, only: [:index]

  before_action :set_customer, only: [:profile, :update_profile_image, :change_password_, :change_mobile, :sign_out_, :user_detail, :wish_list, :remove_wishlist]

  # before_action :set_header_categories
  before_action :set_categories

  def index

  end

  def dashboard
    # @headers = current_user.headers
    @products = current_user.products
    @services = current_user.services

    @enquiries = EnquiriesAlgorithm.new(current_user).result.first

  end

  def registration

  end

  def mobile_number
    @new_user = NewUser.new
  end

  def otp
    if request.format == 'application/json'
      if params[:phone].present?
        @otp = rand(1000..9999).to_s
        @phone = params[:phone]
        user_ = User.where(contact: @phone).first
        if user_.present?
          # already registered
          render status: :unprocessable_entity, json: { errors: 'Already registered', move: 0 }
        else
          new_user =  NewUser.where(phone: @phone).first
          if new_user.present?
            if new_user.update_attributes(otp: @otp)
              # HTTP.get("http://bhashsms.com/api/sendmsg.php?user=ravikataria&pass=123&sender=BYEBUY&phone=#{@phone}&text=Your OTP is #{@otp}&priority=ndnd& stype=normal")
              HTTP.get('http://bhashsms.com/api/sendmsg.php', params: {user: 'ravikataria', pass: '123', sender: 'BYEBUY', phone: @phone, text: "Your OTP is #{@otp}", priority: 'ndnd', style: 'normal'})
              # do nothing
              render status: :ok, json: {new_user: new_user }
            else
              render status: :unprocessable_entity, json: { errors: @customer.errors.full_messages }
            end
          else
            new_user_ = NewUser.create(phone: @phone, otp: @otp)
            # HTTP.get("http://bhashsms.com/api/sendmsg.php?user=ravikataria&pass=123&sender=BYEBUY&phone=#{@phone}&text=Your OTP is #{@otp}&priority=ndnd& stype=normal")
            HTTP.get('http://bhashsms.com/api/sendmsg.php', params: {user: 'ravikataria', pass: '123', sender: 'BYEBUY', phone: @phone, text: "Your OTP is #{@otp}", priority: 'ndnd', style: 'normal'})
            render status: :ok, json: {new_user: new_user_ }
          end
        end
      else
        render status: :unprocessable_entity, json: { errors: @customer.errors.full_messages }
      end
    else
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

  end

  def after_otp

    if request.format == 'application/json'
      @phone = params[:phone]
      new_user = NewUser.where(phone: @phone).last
      if new_user.present?
        if new_user.otp == params[:otp]
          # do nothing
          render status: :ok, json: { success: 'matched'}
        else
          render status: :unprocessable_entity, json: { errors: 'OTP not matched'}
        end
      else
        render status: :unprocessable_entity, json: { errors: @customer.errors.full_messages}
      end
    else
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
  end

  def log_in
    if request.format == 'application/json'
      if sign_in_customer_
        render status: :ok, json: { customer: current_user.as_json }
      else
        render status: :unprocessable_entity, json: { errors: current_user.errors.full_messages  }
      end
    else
      if sign_in_customer_
        # redirect_to action: :index
        render status: :ok, json: { massege: "Signin as #{current_user.name}" }
      else
        # flash[:error] = 'Mobile Number/Password combination wrong, contact super admin.'
        render status: :unprocessable_entity, json: { errors: "Mobile Number/Password are'nt matching."  }
        # render action: :index
      end
    end

  end

  def sign_up
      @customer = Customer.new(customer_params)

      if request.format == 'application/json'
        if @customer.save
          @customer.update_attribute(:api_token, SecureRandom.urlsafe_base64(32))
          sign_in(@customer)
          CustomerMailer.registration(@customer,  @customer.password).deliver_later
          render status: :ok , json: { api_token: @customer.api_token }
        else
          render status: :unprocessable_entity , json: { errors: @customer.errors.full_messages.first }
        end
      else
        if @customer.save
          @customer.update_attribute(:api_token, SecureRandom.urlsafe_base64(32))
          flash[:success] = 'successfully registered.'
          sign_in(@customer)
          CustomerMailer.registration(@customer,  @customer.password).deliver_later
          redirect_to action: :dashboard
        else
          flash[:error] = @customer.errors.full_messages.first
          render action: :registration
        end
      end
  end

  def profile

  end

  def edit_profile
    if request.format == 'application/json'
      if current_user.present?
        if current_user.update_attributes(customer_edit_params)
          render status: :ok, nothing: true
        else
          render status: :unprocessable_entity, json: { errors: current_user.errors.full_messages }
        end
      else
        render status: :unprocessable_entity, json: { errors: ['user not login'] }
      end
    else
      if current_user.present?
        if current_user.update_attributes(customer_edit_params)
          flash[:success] = 'Successfully updated'
          redirect_to customer_profile_path
        else
          flash[:error] = "#{current_user.errors.full_messages.first}"
          redirect_to customer_profile_path
        end
      else
        render status: :unprocessable_entity
      end
    end

  end

  def update_profile_image
    if request.format == 'application/json'
      if @customer.update_attributes(image: params[:image])
        render status: :ok, json: { image: @customer.image.url(:original) }
      else
        render status: :unprocessable_entity, json: { errors: @customer.errors.full_messages }
      end
    else
      if @customer.update_attributes(image: params[:image])
        redirect_to customer_profile_path
      else
        flash[:error] = "#{@customer.errors.full_messages.first}"
        render action: :profile
      end
    end
  end

  def profile_image
    current_user.image.destroy
    if current_user.save
      flash[:success] = 'Successfully removed'
      redirect_to action: :profile
    else
      flash[:error] = 'Something went wrong, please try again later'
      render action: :profile
    end
  end

  def change_password_
    if request.format == 'application/json'
      if @customer.update_attributes(password: params[:password])
        CustomerMailer.change_password(@customer, params[:password]).deliver_later
        render status: :ok
      else
        render status: :unprocessable_entity , json: { errors: @customer.errors.full_messages }
      end
    else
      if @customer.update_attributes(password: params[:password])
        flash[:success] = 'Successfully updated'
        CustomerMailer.change_password(@customer, params[:password]).deliver_later
        redirect_to customer_profile_path
      else
        flash[:error] = "#{@customer.errors.full_messages.first}"
        render action: :profile
      end
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

  def sign_out_
    sign_out(@customer)
    render status: :ok, nothing: true
  end

  def user_detail

  end

  def wish_list
    product_ids = []
    service_ids = []
    for i in @customer.wish_list
      arr = i.split('-')
      if arr.first == '0'
        service_ids << arr.second.to_i
      else
        product_ids << arr.second.to_i
      end

    end

    @products = Product.where(id: product_ids)
    @services = Service.where(id: service_ids)

  end

  def remove_wishlist
    arr = []
    current_user.wish_list.each do |f|
      next if f == params[:wish_id]
      arr << f
    end
    current_user.update_attribute(:wish_list, arr)
    redirect_to '/customer/wish_list'
    # render status: :ok, json: {masseges: ['successfully removed.']}
  end

  private

  # def sign_in_customer
  #   email = params[:email]
  #   password = params[:password]
  #   return false unless email.present? or password.present?
  #   customer = Customer.where(email: email).first
  #   return false unless customer.present?
  #   if customer.valid_password?(password)
  #     flash[:success] = "Signed in as #{customer.email}."
  #     sign_in(customer)
  #   end
  # end

  def sign_in_customer_
    contact = params[:contact]
    password = params[:password]
    return false unless contact.present? or password.present?
    customer = Customer.where(contact: contact).first
    return false unless customer.present?
    if customer.valid_password?(password)
      flash[:success] = "Signed in as #{customer.name}."
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

  def customer_edit_params
    params.require(:customer).permit(:name, :email)
  end


end
