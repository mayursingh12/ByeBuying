json.array! @products do |product|

    json.id product.id
    json.name product.name
    json.description product.description
    json.technical_specification product.technical_specification
    json.location product.location
    json.start_at product.start_at
    json.end_at product.end_at
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
    # json.price_in_rupees product.price_in_rupees
    json.negotiable product.negotiable
    json.rating product.rating
    json.admin_verified product.admin_verified

    json.user_id product.user_id

    json.state{
      json.id product.state.id
      json.name product.state.name
    }

    json.city{
      json.id product.city.id
      json.name product.city.name
    }

    json.category{
      json.id product.subcategory.category.id
      json.name product.subcategory.category.name
    }
    json.subcategory{
      json.id product.subcategory.id
      json.name product.subcategory.name
    }


end