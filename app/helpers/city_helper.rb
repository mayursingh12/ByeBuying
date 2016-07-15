module CitiesHelper

  def city_for_collection
    City.all.collect {|a| [a.name, a.id] }
  end

end