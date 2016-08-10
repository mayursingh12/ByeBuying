json.advertisements{
  json.array! @advertisements do |advertisement|
    json.id advertisement.id
    json.name advertisement.title
    json.name advertisement.description
    json.admin_verified advertisement.admin_verified?
  end
}

json.products{
  json.array! @products do |product|
    json.id product.id
    json.name product.name
    json.category_id product.category_id
    json.gender product.gender
    json.subcategory_id product.subcategory_id
    json.description product.description
    json.technical_specification product.technical_specification
    json.start_at product.start_at
    json.end_at product.end_at
    json.state_id product.state_id
    json.city_id product.city_id
    json.location product.location
    json.quantity product.quantity
    json.rent product.rent
    json.refundable_security product.refundable_security
    json.cost_of_replacement product.cost_of_replacement
    json.youtube_link product.youtube_link
    json.other product.other
    json.user_id product.user_id
    json.price_in_rupees product.price_in_rupees
    json.negotiable product.negotiable?
    json.rating product.rating
    json.admin_verified product.admin_verified?
  end
}

json.services{
  json.array! @services do |service|
    json.id service.id
    json.category_id service.category_id
    json.subcategory_id service.subcategory_id
    json.nature_of_service service.nature_of_service
    json.club_name service.club_name
    json.membership_plan service.membership_plan
    json.start_at service.start_at
    json.end_at service.end_at
    json.service_description service.service_description
    json.state_id service.state_id
    json.city_id service.city_id
    json.location service.location
    json.price_type service.price_type
    json.youtube_link service.youtube_link
    json.other service.other
    json.area_in_meters service.area_in_meters
    json.amenities_available service.amenities_available
    json.user_id service.user_id
    json.price_in_rupees service.price_in_rupees
    json.negotiable service.negotiable?
    json.rating service.rating
    json.admin_verified service.admin_verified?
  end
}