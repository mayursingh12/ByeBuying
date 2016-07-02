class Advertisement < ActiveRecord::Base

  belongs_to :subcategory, class_name: 'Subcategory', foreign_key: :subcategory_id

end
