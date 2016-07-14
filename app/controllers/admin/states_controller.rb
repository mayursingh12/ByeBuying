class Admin::StatesController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_state, only: [:edit, :update]

  def index
    @states = State.all.order(:name)
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = 'State Successfully Created'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @state.update_attributes(state_params)
      flash[:success] = 'Successfully Updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def set_state
    @state = State.find params[:id]
  end

  def state_params
    params.require(:state).permit(:name)
  end

end