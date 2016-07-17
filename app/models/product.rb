class Product < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

end
