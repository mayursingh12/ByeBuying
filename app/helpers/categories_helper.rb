module CategoriesHelper

  def category_for_collection
    categories = []
    x = []
    tmp_array = []
    other_object = Category.where(is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(is_verified: true).where("name NOT LIKE ?", "%others%").collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

  def service_category_collection

    categories = []
    x = []
    tmp_array = []

    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Service').map {|x| x.category_id }.uniq

    other_object = Category.where(id: category_ids,is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(id: category_ids, is_verified: true).where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

  def product_category_collection
    categories = []
    x = []
    tmp_array = []

    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Product').map {|x| x.category_id }.uniq

    other_object = Category.where(id: category_ids, is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(id: category_ids, is_verified: true).where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

  def membership_category_collection
    categories = []
    x = []
    tmp_array = []

    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Membership').map {|x| x.category_id }.uniq

    other_object = Category.where(id: category_ids, is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(id: category_ids, is_verified: true).where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

  def space_category_collection

    categories = []
    x = []
    tmp_array = []

    category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Commercial Space').map {|x| x.category_id }.uniq

    other_object = Category.where(id: category_ids, is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(id: category_ids, is_verified: true).where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

  def service_category_collertion
    categories = []
    x = []
    tmp_array = []

    membership_category_ids = Subcategory.where(is_verified: true, subcategory_type: 'Membership').map {|x| x.category_id }.uniq
    space_category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Commercial Space').map {|x| x.category_id }.uniq
    service_category_ids =  Subcategory.where(is_verified: true, subcategory_type: 'Service').map {|x| x.category_id }.uniq

    category_ids = []

    category_ids << membership_category_ids if membership_category_ids.present?
    category_ids << space_category_ids if space_category_ids.present?
    category_ids << service_category_ids if service_category_ids.present?

    category_ids = category_ids.uniq

    other_object = Category.where(id: category_ids, is_verified: true,name: 'Others' ).last
    tmp_array = Category.where(id: category_ids, is_verified: true).where.not(name: ['Others']).collect{ |a| [a.name, a.id] }
    if other_object.present?
      x = [[other_object.name, other_object.id]]
    end
    categories = tmp_array + x
    categories
  end

end
