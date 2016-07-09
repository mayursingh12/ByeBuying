class Category < ActiveRecord::Base

  belongs_to :subcategory

  validates :name, presence: true, uniqueness: {case_sensitive: false}

end
