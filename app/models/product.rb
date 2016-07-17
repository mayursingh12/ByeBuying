class Product < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

  has_many :product_images, dependent: :destroy

end
