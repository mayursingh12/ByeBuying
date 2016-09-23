class AddColumnToService < ActiveRecord::Migration
  def change
    add_column :services, :is_enquired, :boolean, default: false
  end
end
