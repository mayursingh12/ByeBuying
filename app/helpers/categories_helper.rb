module CategoriesHelper

  def category_for_collection
    Category.all.collect{ |a| [a.name, a.id] }
  end

end