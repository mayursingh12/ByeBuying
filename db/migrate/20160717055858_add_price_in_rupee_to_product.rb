class AddPriceInRupeeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price_in_rupees, :float, default: 0.0
  end
end
