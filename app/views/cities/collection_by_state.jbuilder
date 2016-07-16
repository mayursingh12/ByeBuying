json.array! @cities.each do |city|
  json.id city.id
  json.name city.name
end