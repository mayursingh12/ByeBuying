class AddMultiExpectedPriceToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :expected_per_hour_price, :float, default: 0.0
    add_column :enquiries, :expected_per_day_price, :float, default: 0.0
    add_column :enquiries, :expected_per_week_price, :float, default: 0.0
    add_column :enquiries, :expected_per_month_price, :float, default: 0.0
  end
end
