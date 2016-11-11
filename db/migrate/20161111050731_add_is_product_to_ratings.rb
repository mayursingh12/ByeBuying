class AddIsProductToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :is_product, :boolean
  end
end
