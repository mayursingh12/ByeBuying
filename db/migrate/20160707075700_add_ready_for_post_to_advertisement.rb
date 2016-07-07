class AddReadyForPostToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :ready_for_post, :boolean, default: false
  end
end
