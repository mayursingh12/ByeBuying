class CustomerMailer < ApplicationMailer

  add_template_helper(ApplicationHelper)

  layout 'customer_mailer'

  def registration(user, password)
    @user = user
    @password = password
    mail(
        to: user.email,
        subject: 'Welcome to ByeBuying'
    )
  end

  def change_password(user, password)
    @user = user
    @password = password
    mail(
        to: @user.email,
        subject: 'Password Change Notification'
    )
  end

  def product_enquiry(enquiry)
    @enquiry = enquiry
    @product = @enquiry.product
    @user = @enquiry.product.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad##{@enquiry.id}"
    )
  end

  def service_enquiry(enquiry)
    @enquiry = enquiry
    @service = @enquiry.service
    @user = @enquiry.service.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad##{@enquiry.id}"
    )
  end

  def product_reminder_enquiry(enquiry)
    @enquiry = enquiry
    @product = @enquiry.product
    @user = @enquiry.product.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad##{@enquiry.id}"
    )

  end

  def service_reminder_enquiry(enquiry)
    @enquiry = enquiry
    @service = @enquiry.service
    @user = @enquiry.service.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad##{@enquiry.id}"
    )

  end

end
