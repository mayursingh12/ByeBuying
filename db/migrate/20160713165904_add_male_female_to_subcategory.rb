class AddMaleFemaleToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :male, :boolean, default: false
    add_column :subcategories, :female, :boolean, default: false
  end
end
