class AddDefaultvalueToService < ActiveRecord::Migration
  def change
    change_column :services, :rating, :integer, default: 0
  end
end
