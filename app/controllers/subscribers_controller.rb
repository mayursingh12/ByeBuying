class SubscribersController < ApplicationController


  def new
    @subscriber = Subscriber.new
  end

  def create
    1
  end

  private

  def subscriber_params
    params.required(:subscriber).permit(:name,
                                        :email,
                                        :mobile,
                                        :message)
  end

end