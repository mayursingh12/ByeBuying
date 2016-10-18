class AddImagetypeToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :position, :integer, default: 1
  end
end
