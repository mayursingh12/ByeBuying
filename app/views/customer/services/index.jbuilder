json.array! @services do |service|

  json.id service.id
  json.name service.name
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
  json.price_in_rupees service.price_in_rupees
  json.negotiable service.negotiable
  json.rating service.rating
  json.admin_verified service.admin_verified
  json.per_hour_price service.per_hour_price
  json.per_day_price service.per_day_price
  json.per_week_price service.per_week_price
  json.per_month_price service.per_month_price
  json.is_enquired service.is_enquired
  json.average_rating service.average_rating
  json.customer_review service.customer_review
  json.recommand_count service.recommand_count

end