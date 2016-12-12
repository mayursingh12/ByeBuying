json.array! @enquiries[:customer_enquiries] do |enquiry|

  json.id enquiry.id
  json.id enquiry
  json.product enquiry.product
  json.service enquiry.service

end