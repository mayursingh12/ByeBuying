class Category < ActiveRecord::Base

  belongs_to :subcategory

  has_many :subcategories

  validates :name, presence: true, uniqueness: {case_sensitive: false}

end
