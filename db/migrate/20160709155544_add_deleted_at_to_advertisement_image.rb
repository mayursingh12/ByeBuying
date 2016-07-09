class AddDeletedAtToAdvertisementImage < ActiveRecord::Migration
  def change
    add_column :advertisement_images, :deleted_at, :datetime
    add_index :advertisement_images, :deleted_at
  end
end
