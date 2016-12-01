class AddDeletedAtToHeaderImages < ActiveRecord::Migration
  def change
    add_column :header_images, :deleted_at, :datetime
    add_index :header_images, :deleted_at
  end
end
