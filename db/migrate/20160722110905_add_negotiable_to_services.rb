class AddNegotiableToServices < ActiveRecord::Migration
  def change
    add_column :services, :negotiable, :boolean, default: false
  end
end
