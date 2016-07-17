class AddPriceInRupeeToService < ActiveRecord::Migration
  def change
    add_column :services, :price_in_rupees, :float, default: 0.0
  end
end
