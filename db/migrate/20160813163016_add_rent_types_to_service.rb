class AddRentTypesToService < ActiveRecord::Migration
  def change
    add_column :services, :per_hour_price, :float, default: 0.0
    add_column :services, :per_day_price, :float, default: 0.0
    add_column :services, :per_week_price, :float, default: 0.0
    add_column :services, :per_month_price, :float, default: 0.0
  end
end
