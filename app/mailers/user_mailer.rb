class UserMailer < ApplicationMailer

  def test_mailer(email)
    mail(
        to: email,
        subject: 'Test mailer'
    )
  end

end
