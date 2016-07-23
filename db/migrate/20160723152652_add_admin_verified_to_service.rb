class AddAdminVerifiedToService < ActiveRecord::Migration
  def change
    add_column :services, :admin_verified, :boolean, default: false
  end
end
