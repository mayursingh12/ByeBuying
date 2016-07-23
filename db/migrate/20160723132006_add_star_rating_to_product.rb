class AddStarRatingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :rating, :integer, default: 1
  end
end
