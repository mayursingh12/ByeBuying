class AddUserIdToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :user_id, :integer
  end
end
