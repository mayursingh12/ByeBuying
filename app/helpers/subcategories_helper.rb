module SubcategoriesHelper

  def subcategory_for_collection
    Subcategory.all.collect{ |a| [a.name, a.id] }
  end

  def subcategory_by_category_for_collection(category)
    Subcategory.all.where(category_id: category.id).collect{ |a| [a.name, a.id] }
  end

end