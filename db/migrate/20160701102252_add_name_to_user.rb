class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_attachment :users, :image
  end
end
