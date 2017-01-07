class AddQuantityToEnquiries < ActiveRecord::Migration
  def change
    add_column :enquiries, :quantity, :integer
  end
end
