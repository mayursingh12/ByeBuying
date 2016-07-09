class AddDeletedAtToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :deleted_at, :datetime
    add_index :advertisements, :deleted_at
  end
end
