module StatesHelper

  def state_for_collection
    State.order(:name).all.collect {|a| [a.name, a.id] }
  end

end