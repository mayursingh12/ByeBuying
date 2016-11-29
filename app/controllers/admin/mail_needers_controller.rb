class Admin::MailNeedersController < Admin::BaseController

  def index
    @mail_needers = MailNeeder.all.order(:email)
  end

  private

  def mail_needer_params
    params.require(:mail_needer).permit(:email)
  end

end