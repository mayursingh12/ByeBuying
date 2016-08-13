class AddRentTypesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :per_hour_price, :float, default: 0.0
    add_column :products, :per_day_price, :float, default: 0.0
    add_column :products, :per_week_price, :float, default: 0.0
    add_column :products, :per_month_price, :float, default: 0.0
  end
end
