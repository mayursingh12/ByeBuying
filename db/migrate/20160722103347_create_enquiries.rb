class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.float :expected_price
      t.integer :user_id
      t.string :status
      t.integer :product_id
      t.integer :service_id
      t.boolean :is_product

      t.timestamps null: false
    end
  end
end
