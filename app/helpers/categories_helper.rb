module CategoriesHelper

  def category_for_collection
    Category.all.collect{ |a| [a.name, a.id] }
  end

  def product_category_collection
    Category.where(name: ['Health & Wellness', 'Kids', 'Interests & Hobbies', 'Others']).collect{ |a| [a.name, a.id] }
  end

end