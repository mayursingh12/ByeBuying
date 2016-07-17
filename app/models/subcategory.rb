class Subcategory < ActiveRecord::Base

  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  has_many :products

  has_many :services

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: {:scope => [:name, :category_id], :message => "already exists", case_sensitive: false }


  validate def wed_plan
             if self.name.present? and self.category.name == 'Wedding Collection' and self.male.blank? and self.female.blank?
               self.errors.add(:female, 'choose male or female')
             end
  end



end
