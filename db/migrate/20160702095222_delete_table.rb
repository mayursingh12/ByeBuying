class DeleteTable < ActiveRecord::Migration
  def change
    drop_table :sub_categories
  end
end
