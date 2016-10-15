class AddInteriorImageToSubcategory < ActiveRecord::Migration
  def change
    add_attachment :subcategories, :interior_image
  end
end
