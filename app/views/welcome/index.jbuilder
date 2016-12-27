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
    # json.rent product.rent

    json.per_hour_price product.per_hour_price
    json.per_day_price product.per_day_price
    json.per_week_price product.per_week_price
    json.per_month_price product.per_month_price

    json.refundable_security product.refundable_security
    json.cost_of_replacement product.cost_of_replacement
    json.youtube_link product.youtube_link
    json.other product.other
    json.user_id product.user_id
    # json.price_in_rupees product.price_in_rupees
    json.negotiable product.negotiable?
    json.rating product.rating
    json.admin_verified product.admin_verified?
    json.images product.product_images.map{ |i| i.image.url(:size_500x500) }
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
    json.per_hour_price service.per_hour_price
    json.per_day_price service.per_day_price
    json.per_week_price service.per_week_price
    json.per_month_price service.per_month_price
    # json.price_type service.price_type
    json.youtube_link service.youtube_link
    json.other service.other
    json.area_in_meters service.area_in_meters
    json.amenities_available service.amenities_available
    json.user_id service.user_id
    # json.price_in_rupees service.price_in_rupees
    json.negotiable service.negotiable?
    json.rating service.rating
    json.admin_verified service.admin_verified?
    json.images service.service_images.map{ |i| i.image.url(:size_500x500) }
  end
}

json.advertisements{
  json.array! @advertisements do |advertisement|
    json.id advertisement.id
    json.name advertisement.title
    json.description advertisement.description
    json.redirect_link advertisement.redirect_link
    json.images advertisement.advertisement_images.map{ |i| i.image.url(:original) }
  end
}
json.top_advertisements{
  json.array! @top_advertisements do |top_advertisement|
    json.id top_advertisement.id
    json.name top_advertisement.title
    json.description top_advertisement.description
    json.redirect_link top_advertisement.redirect_link
    json.images top_advertisement.advertisement_images.map{ |i| i.image.url(:original) }
  end
}
json.mid_advertisements{
  json.array! @mid_advertisements do |mid_advertisements|
    json.id mid_advertisements.id
    json.name mid_advertisements.title
    json.description mid_advertisements.description
    json.redirect_link mid_advertisements.redirect_link
    json.images mid_advertisements.advertisement_images.map{ |i| i.image.url(:original) }
  end
}
json.bottom_advertisements{
  json.array! @bottom_advertisements do |bottom_advertisements|
    json.id bottom_advertisements.id
    json.name bottom_advertisements.title
    json.description bottom_advertisements.description
    json.redirect_link bottom_advertisements.redirect_link
    json.images bottom_advertisements.advertisement_images.map{ |i| i.image.url(:original) }
  end
}

json.categories{
  json.array! @categories do |category|

    json.id category.id
    json.name category.name
    json.detail_image category.detail_image
    json.created_at category.created_at
    json.icon_image category.icon_image
    json.interior_image category.interior_image

  end
}
json.subcategories{
  json.array! @subcategories do |subcategory|
    json.id subcategory.id
    json.name subcategory.name
  end
}