class UserMailer < ApplicationMailer

  add_template_helper(ApplicationHelper)

  def test_mailer(email)
    mail(
        to: email,
        subject: 'Test mailer'
    )
  end

  def enquiry_ending(enquiry)
    @enquiry = enquiry
    mail(
        to: @enquiry.user.email,
        subject: 'Please rate your product/service'
    )
  end

end
