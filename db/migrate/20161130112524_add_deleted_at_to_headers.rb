class AddDeletedAtToHeaders < ActiveRecord::Migration
  def change
    add_column :headers, :deleted_at, :datetime
    add_index :headers, :deleted_at
  end
end
