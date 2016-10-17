json.array! @categories do |category|

  json.id category.id
  json.name category.name

  json.icon_image category.icon_image(:original)
  json.detail_image category.detail_image(:original)
  json.interior_image category.interior_image(:original)

  json.subcategories{
    json.array! category.subcategories do |subcategory|
      json.id subcategory.id
      json.name subcategory.name
      json.is_male subcategory.male
      json.is_female subcategory.female
      json.subcategory_type subcategory.female

      json.interior_image category.interior_image(:original)
    end
  }


end