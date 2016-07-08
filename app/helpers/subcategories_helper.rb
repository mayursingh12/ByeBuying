module SubcategoriesHelper

  def subcategory_for_collection
    Subcategory.all.collect{ |a| [a.name, a.id] }
  end

end