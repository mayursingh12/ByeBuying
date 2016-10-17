class AddIsapprovedToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :is_verified, :boolean, default: false
  end
end
