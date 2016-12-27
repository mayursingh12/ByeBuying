json.array! @products do |product|

  json.id product.id
  json.name product.name
  json.product_images product.product_images
  json.description product.description
  json.technical_specification product.technical_specification
  json.quantity product.quantity
  json.rent product.rent
  json.refundable_security product.refundable_security
  json.cost_of_replacement product.cost_of_replacement
  json.youtube_link product.youtube_link
  json.other product.other
  json.created_at product.created_at
  json.negotiable product.negotiable
  json.rating product.rating
  json.per_hour_price product.per_hour_price
  json.per_day_price product.per_day_price
  json.per_week_price product.per_week_price
  json.per_month_price product.per_month_price
  json.is_enquired product.is_enquired
  json.average_rating product.average_rating
  json.customer_review product.customer_review
  json.recommand_count product.recommand_count
  json.user_id product.user_id

end