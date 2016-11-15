class AddRecommandCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :recommand_count, :integer
  end
end
