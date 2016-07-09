class Subcategory < ActiveRecord::Base

  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true



end
