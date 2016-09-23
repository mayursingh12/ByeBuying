class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :is_enquired, :boolean, default: false
  end
end
