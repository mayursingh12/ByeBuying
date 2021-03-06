class Subcategory < ActiveRecord::Base

  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  has_many :products, dependent: :destroy

  has_many :services, dependent: :destroy

  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: {:scope => [:name, :category_id], :message => "already exists", case_sensitive: false }

  has_attached_file :interior_image
  validates_attachment_content_type :interior_image, content_type: /\Aimage\/.*\Z/

  validate def wed_plan
             if self.name.present? and self.category.name == 'Wedding Collection' and self.male.blank? and self.female.blank?
               self.errors.add(:female, 'choose male or female')
             end
  end



end
