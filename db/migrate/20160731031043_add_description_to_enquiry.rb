class AddDescriptionToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :description, :text
  end
end
