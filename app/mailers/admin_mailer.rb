class AdminMailer < ApplicationMailer

  default to: 'info@byebuying.com'

  add_template_helper(ApplicationHelper)

  layout 'customer_mailer'

  def test_mailer(email)
    mail(
        to: email,
        subject: 'Test mailer'
    )
  end

  def contact_us(subscriber)
    @subscriber = subscriber
    mail(
        subject: 'contact us enquiry'
    )
  end

end
