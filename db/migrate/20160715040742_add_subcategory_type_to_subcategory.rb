class AddSubcategoryTypeToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :subcategory_type, :string
  end
end
