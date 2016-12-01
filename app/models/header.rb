class Header < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :subcategory, class_name: 'Subcategory', foreign_key: :subcategory_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  has_many :header_images, dependent: :destroy

end
