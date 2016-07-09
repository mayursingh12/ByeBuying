class RemoveFeildsFromAdvertisement < ActiveRecord::Migration
  def change
    remove_column :advertisements, :contact
    remove_column :advertisements, :email
  end
end
