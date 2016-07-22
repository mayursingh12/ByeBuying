class AddNegotiableToProduct < ActiveRecord::Migration
  def change
    add_column :products, :negotiable, :boolean, default: false
  end
end
