class AddUserNameToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :user_name, :string
  end
end
