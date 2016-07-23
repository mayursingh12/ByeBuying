class AddStarRatingToService < ActiveRecord::Migration
  def change
    add_column :services, :rating, :integer, default: 1
  end
end
