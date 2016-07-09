class Subcategory < ActiveRecord::Base

  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  validates :category_id, presence: true
  validates :name, presence: true, :uniqueness => {:scope => [:name, :category_id], :message => "already exists", case_sensitive: false }

end
