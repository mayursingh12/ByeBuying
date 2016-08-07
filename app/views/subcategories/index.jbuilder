json.array! @subcategories do |subcategory|

  json.id subcategory.id
  json.name subcategory.name
  json.male subcategory.male
  json.female subcategory.female
  json.subcategory_type subcategory.subcategory_type

  json.category{
    json.id subcategory.category.id
    json.name subcategory.category.name
  }

end