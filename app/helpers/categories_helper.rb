module CategoriesHelper

  def category_for_collection
    Category.where(is_verified: true).collect{ |a| [a.name, a.id] }
  end

  def service_category_collection
    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Service').map {|x| x.category_id }.uniq
    Category.where(is_verified: true, id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def product_category_collection
    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Product').map {|x| x.category_id }.uniq
    Category.where(is_verified: true, id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def membership_category_collection
    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Membership').map {|x| x.category_id }.uniq
    Category.where(is_verified: true, id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def space_category_collection
    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Commercial Space').map {|x| x.category_id }.uniq
    Category.where(is_verified: true, id: category_ids).collect{ |a| [a.name, a.id] }
  end

  def service_category_collertion
    membership_category_ids = Subcategory.where(is_verified: true, subcategory_type: 'Membership').map {|x| x.category_id }.uniq
    space_category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Commercial Space').map {|x| x.category_id }.uniq
    service_category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Service').map {|x| x.category_id }.uniq

    category_ids = []

    category_ids << membership_category_ids if membership_category_ids.present?
    category_ids << space_category_ids if space_category_ids.present?
    category_ids << service_category_ids if service_category_ids.present?

    Category.where(is_verified: true, id: category_ids).collect{ |a| [a.name, a.id] }
  end

end