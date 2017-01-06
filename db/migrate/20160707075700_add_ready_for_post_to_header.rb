class AddReadyForPostToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :ready_for_post, :boolean, default: false
  end
end
