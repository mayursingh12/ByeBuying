class AddRedirectLinkToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :redirect_link, :text
  end
end
