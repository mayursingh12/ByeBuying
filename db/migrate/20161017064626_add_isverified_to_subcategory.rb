class AddIsverifiedToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :is_verified, :boolean, default: false
  end
end
