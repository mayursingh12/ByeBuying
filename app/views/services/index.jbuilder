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
  json.negotiable service.negotiable?
  json.per_hour_price service.per_hour_price
  json.per_day_price service.per_day_price
  json.per_week_price service.per_week_price
  json.per_month_price service.per_month_price

  json.service_images{
    json.array! service.service_images do |service_image|
      json.id service_image.id
      json.url service_image.image.url(:original)
    end
  }

end