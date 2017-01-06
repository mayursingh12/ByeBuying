class RemoveFeildsFromHeader < ActiveRecord::Migration
  def change
    remove_column :headers, :contact
    remove_column :headers, :email
  end
end
