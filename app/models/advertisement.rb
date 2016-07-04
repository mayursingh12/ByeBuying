class Advertisement < ActiveRecord::Base

  belongs_to :subcategory, class_name: 'Subcategory', foreign_key: :subcategory_id

  has_many :advertisement_images

end
