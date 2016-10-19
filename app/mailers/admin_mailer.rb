class AdminMailer < ApplicationMailer

  def test_mailer(email)
    mail(
        to: email,
        subject: 'Test mailer'
    )
  end

  def contact_us(subscriber)
    @subscriber = subscriber
    mail(
        to: email,
        subject: 'contact us enquiry'
    )
  end

end
