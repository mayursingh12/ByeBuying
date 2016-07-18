class Customer::ProfileController < Customer::BaseController

  before_action :set_profile, only: [:edit, :show]

  def edit

  end

  def show

  end

  private

  def set_profile
    @customer = current_user
  end

end