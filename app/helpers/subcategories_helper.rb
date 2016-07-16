module SubcategoriesHelper

  def subcategory_for_collection
    Subcategory.all.collect{ |a| [a.name, a.id] }
  end

  def membership_subcategory_collection
    Subcategory.where(name: ['Gym', 'Clubs', 'Swimming', 'Others']).collect{ |a| [a.name, a.id] }
  end

  def service_subcategory_collection
    Subcategory.where(subcategory_type: 'Service').collect{ |a| [a.name, a.id] }
  end

end