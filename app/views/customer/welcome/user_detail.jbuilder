

# user_ = User.where(user_id: params[:id])
#
# json.array! @customer do |customer|
#
#

# if customer.id == params (id
#                          )
# end

# json.id user_.id
# json.name user_.name
# json.email user_.email
# json.contact user_.contact
# json.image user_.image.url(:original)

# end







json.id @customer.id
json.name @customer.name
json.email @customer.email
json.contact @customer.contact
json.image @customer.image.url(:original)
