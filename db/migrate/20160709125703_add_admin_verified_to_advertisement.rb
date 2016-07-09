class AddAdminVerifiedToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :admin_verified, :boolean, default: false
  end
end
