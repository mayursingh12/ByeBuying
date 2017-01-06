class AddAdminVerifiedToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :admin_verified, :boolean, default: false
  end
end
