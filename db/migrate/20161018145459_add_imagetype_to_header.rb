class AddImagetypeToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :position, :integer, default: 1
  end
end
