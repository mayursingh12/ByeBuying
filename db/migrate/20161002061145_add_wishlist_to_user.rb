class AddWishlistToUser < ActiveRecord::Migration
  def change
    add_column :users, :wish_list, :text
  end
end
