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
        subject: "Enquiry Received– Ad Product##{@product.id}"
    )
  end

  def service_enquiry(enquiry)
    @enquiry = enquiry
    @service = @enquiry.service
    @user = @enquiry.service.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad Service##{@service.id}"
    )
  end

  def product_reminder_enquiry(enquiry)
    @enquiry = enquiry
    @product = @enquiry.product
    @user = @enquiry.product.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad Product##{@product.id}"
    )

  end

  def service_reminder_enquiry(enquiry)
    @enquiry = enquiry
    @service = @enquiry.service
    @user = @enquiry.service.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad Service##{@service.id}"
    )

  end

  def product_un_verified(product)
    @product = product
    @user = @product.user
    mail(
        to: @user.email,
        subject: "Your Ad Cannot be Published - Prohibited Content Detected: Ad Product##{@product.id} "
    )
  end

  def service_un_verified(service)
    @service = service
    @user = @service.user
    mail(
        to: @user.email,
        subject: "Your Ad Cannot be Published - Prohibited Content Detected: Ad Service##{@service.id} "
    )
  end

  def product_verified(product)
    @product = product
    @user = @product.user
    mail(
        to: @user.email,
        subject: "Congratulations!!! Your Ad has been published."
    )
  end

  def service_verified(service)
    @service = service
    @user = @service.user
    mail(
        to: @user.email,
        subject: "Congratulations!!! Your Ad has been published."
    )
  end

  def product_quoted(quote)
    @quote = quote
    @product = @quote.product
    @user = @quote.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad Product##{@product.id}"
    )
  end

  def service_quoted(quote)
    @quote = quote
    @service = @quote.service
    @user = @quote.user
    mail(
        to: @user.email,
        subject: "Enquiry Received– Ad Service##{@service.id}"
    )
  end

  def product_deal_confirmed(confirmed_enquiry)
    @confirmed_enquiry = confirmed_enquiry
    @product = @confirmed_enquiry.product
    mail(
        to: @product.user.email,
        subject: "DEAL Confirmation: Enquiry Made– Ad Product##{@product.id}"
    )
  end

  def service_deal_confirmed(confirmed_enquiry)
    @confirmed_enquiry = confirmed_enquiry
    @service = @confirmed_enquiry.service
    mail(
        to: @service.user.email,
        subject: "DEAL Confirmation: Enquiry Made– Ad Service##{@service.id}"
    )
  end

  def product_deal_cancelled(cancelled_enquiry)
    @cancelled_enquiry = cancelled_enquiry
    @product = @cancelled_enquiry.product
    mail(
        to: @product.user.email,
        subject: "NO DEAL: Enquiry Made on– Ad Product##{@product.id}"
    )
  end

  def service_deal_cancelled(cancelled_enquiry)
    @cancelled_enquiry = cancelled_enquiry
    @service = @cancelled_enquiry.service
    mail(
        to: @service.user.email,
        subject: "NO DEAL: Enquiry Made on– Ad Service##{@service.id}"
    )
  end

  def product_publish(product)
    @product = product
    mail(
        to: @product.user.email,
        subject: "Congratulations!!! Your Ad has been published."
    )
  end

  def service_publish(service)
    @service = service
    mail(
        to: @service.user.email,
        subject: "Congratulations!!! Your Ad has been published."
    )
  end

end
