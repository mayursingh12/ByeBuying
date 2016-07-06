json.array! @subcategories.each do |subcategory|
  json.id subcategory.id
  json.name subcategory.name
end