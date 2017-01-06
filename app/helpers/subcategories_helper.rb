module SubcategoriesHelper

  def subcategory_for_collection
    subcategories = Subcategory.all.where("name NOT LIKE ?", "%others%").collect{ |a| [a.name, a.id] }
    other_object = Subcategory.where(is_verified: true,name: 'Others' ).last
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    subcategories = subcategories + x
    subcategories
  end

  def membership_subcategory_collection
    Subcategory.where(name: ['Gym', 'Clubs', 'Swimming', 'Others']).collect{ |a| [a.name, a.id] }
  end

  def service_subcategory_collection
    Subcategory.where(subcategory_type: 'Service').collect{ |a| [a.name, a.id] }
  end

end
