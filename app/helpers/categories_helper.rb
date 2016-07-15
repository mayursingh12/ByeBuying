module CategoriesHelper

  def category_for_collection
    Category.all.collect{ |a| [a.name, a.id] }
  end

  def service_category_collection
    category_ids =  Subcategory.where(subcategory_type: 'Service').map {|x| x.category_id }.uniq
    Category.where(id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def product_category_collection
    category_ids =  Subcategory.where(subcategory_type: 'Product').map {|x| x.category_id }.uniq
    Category.where(id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def membership_category_collection
    category_ids =  Subcategory.where(subcategory_type: 'Membership').map {|x| x.category_id }.uniq
    Category.where(id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def space_category_collection
    category_ids =  Subcategory.where(subcategory_type: 'Space').map {|x| x.category_id }.uniq
    Category.where(id: category_ids).collect{ |a| [a.name, a.id] }
  end

end