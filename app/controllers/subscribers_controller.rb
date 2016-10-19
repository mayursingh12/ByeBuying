class SubscribersController < ApplicationController

  # before_action :set_header_categories
  before_action :set_categories

  def create
    @subscriber = Subscriber.new(name: params[:name],
                                 mobile: params[:mobile],
                                 email: params[:email],
                                 message: params[:message])
    if @subscriber.save
      AdminMailer.contact_us(@subscriber).deliver_later
      CustomerMailer.contact_us(@subscriber).deliver_later
      flash[:success] = 'We have recieved your query, we will contact you soon.'
      redirect_to contact_us_path
    else
      flash[:error] = @subscriber.errors.full_messages.first
      render template: 'welcome/contact_us', layout: 'default'
    end
  end

  private

  # def set_header_categories
  #   @categories = Category.all
  # end

end