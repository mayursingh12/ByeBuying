class Category < ActiveRecord::Base

  belongs_to :subcategory

  has_many :subcategories

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_attached_file :icon_image
  validates_attachment_content_type :icon_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :detail_image
  validates_attachment_content_type :detail_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :interior_image
  validates_attachment_content_type :interior_image, content_type: /\Aimage\/.*\Z/

  def ordered_subcategories
    subcategories = self.subcategories.where("name NOT LIKE ?", "%others%")
    other_object  = self.subcategories.where("name LIKE ?", "%others%")
    subcategories += other_object
  end

end
