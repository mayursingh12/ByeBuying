class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.attachment :image
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
