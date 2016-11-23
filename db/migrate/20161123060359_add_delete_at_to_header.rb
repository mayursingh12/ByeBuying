class AddDeleteAtToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :delete_at, :datetime
    add_index :headers, :delete_at
  end
end
