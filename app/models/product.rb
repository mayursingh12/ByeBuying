class Product < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

  has_many :product_images, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: :user_id

end
