module StatesHelper

  def state_for_collection
    State.all.collect {|a| [a.name, a.id] }
  end

end