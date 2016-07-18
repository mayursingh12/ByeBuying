module CitiesHelper

  def city_for_collection
    City.order(:name).all.collect {|a| [a.name, a.id] }
  end

end