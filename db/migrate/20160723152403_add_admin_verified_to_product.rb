class AddAdminVerifiedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :admin_verified, :boolean, default: false
  end
end
